using System;
using DocuCopy.Model;
using DocuCopy.Model.Enums;

namespace DocuCopy.Algorithm
{
	public class Files
	{
        public SingleFile[] SingleFiles { get; private set; }

        private CopyHead copyHead;

        public Files(string[] fileNames, CopyHead copyHead)
		{
            SingleFiles = new SingleFile[fileNames.Length];
            this.copyHead = copyHead;
            for (var pos = 0; pos<fileNames.Length; pos++)
            {
                SingleFiles[pos] = new SingleFile { Path = fileNames[pos] };
            }
		}

        internal void Check()
        {
            foreach (var file in SingleFiles)
            {
                Console.WriteLine("Checking " + file.Path);
                foreach (var copyEntry in copyHead.CopyEntries)
                {
                    if (file.Matches(copyEntry.WildCard))
                    {
                        file.MatchedCopyEntry = copyEntry;
                        Console.WriteLine(file.Path + " matches "+copyEntry.WildCard);
                        break;
                    }
                }
            }
        }

        internal void CalcDestination()
        {
            var destination = String.Empty;
            foreach (SingleFile singleFile in SingleFiles)
            {
                try
                {
                    if (singleFile.MatchedCopyEntry != null)
                    {
                        destination = singleFile.MatchedCopyEntry.Destination;
                        if (destination.StartsWith("/") || destination.Length>3 && destination.Substring(1, 3) == ":\\\\")
                        {
                            destination = Path.Combine(destination, singleFile.FileName);
                        }
                        else
                        {
                            destination = Path.Combine(copyHead.DestDir, destination, singleFile.FileName);
                        }
                    }
                    else
                    {
                        destination = Path.Combine(copyHead.LeftDir, singleFile.FileName);
                    }
                } catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
;                   Console.WriteLine(ex.StackTrace);
                }
                singleFile.DestinationPath = destination;
            }

        }

        internal void Process()
        {
            foreach (var singleFile in SingleFiles)
            {
                var operation = singleFile.MatchedCopyEntry == null ? MovementKind.Move : singleFile.MatchedCopyEntry.MovementKind;
                switch (operation)
                {
                    case MovementKind.Copy: copy(singleFile.Path, singleFile.DestinationPath); break;
                    case MovementKind.Move: move(singleFile.Path, singleFile.DestinationPath); break;
                    case MovementKind.Delete: delete(singleFile.Path); break;
                }
            }
        }

        private void checkDestinationPath(string path)
        {
            var directoryPath = Path.GetDirectoryName(path);
            if (!Directory.Exists(directoryPath))
            {
                Directory.CreateDirectory(directoryPath);
            }
        }

        private void delete(string path)
        {
            File.Delete(path);
        }

        private void move(string path, string destinationPath)
        {
            checkDestinationPath(destinationPath);
            File.Move(path, destinationPath);
        }

        private void copy(string path, string destinationPath)
        {
            checkDestinationPath(destinationPath);
            File.Copy(path, destinationPath);
        }

        internal void WriteLogs()
        {
            var count = 0;
            var notKnown = 0;
            if (!Directory.Exists(copyHead.LogDir))
            {
                Directory.CreateDirectory(copyHead.LogDir);
            }
            var logLines = new List<String>();
            foreach(var singleFile in SingleFiles)
            {
                logLines.Append(singleFile.FileName + getOperationName(singleFile.MatchedCopyEntry) + " nach " + singleFile.DestinationPath);
                count++;
                if (singleFile.MatchedCopyEntry == null)
                {
                    notKnown++;
                } else
                {
                    singleFile.MatchedCopyEntry.Count++;
                }
            }
            logLines.Append("=================");
            foreach (var copyEntry in copyHead.CopyEntries)
            {
                logLines.Append(copyEntry.WildCard + " : " + copyEntry.Count);
            }
            logLines.Append("#######################");
            logLines.Append("Gesamtanzahl: " + count);

            File.WriteAllLines(Path.Combine(copyHead.LogDir, "copy.log"), logLines);
        }

        private string getOperationName(CopyEntry matchedCopyEntry)
        {
            if (matchedCopyEntry == null)
            {
                return "nicht zugeordnet, verschoben";
            }
            switch (matchedCopyEntry.MovementKind)
            {
                case MovementKind.Unknown: return "Unbekannt";
                case MovementKind.Copy: return "kopiert";
                case MovementKind.Move: return "Verschoben";
                case MovementKind.Delete: return "Gelöscht";
                default: return "????";
            }
        }
    }
}

