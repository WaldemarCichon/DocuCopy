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
                        continue;
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

        }
    }
}

