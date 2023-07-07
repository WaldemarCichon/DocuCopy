using System;
namespace DocuCopy.Model
{
	public class CopyHead
	{
		public String SourceDir { get; private set; }
		public String DestDir { get; private set; }
		public String LeftDir { get; private set; }
		public List<CopyEntry> CopyEntries { get; set; } = new List<CopyEntry>();
        public string LogDir { get; internal set; }

        public CopyHead(String[] lines)
		{
			SourceDir = lines[0];
			DestDir = lines[1];
			LeftDir = lines[2];
			for (int i=3; i<lines.Length; i++)
			{
				if (lines[i].Length > 0)
				{
					CopyEntries.Add(new CopyEntry(lines[i]));
				}
			}
		}

		public CopyHead(String filePath): this(readLines(filePath))
		{

		}

		private static string[] /*Task<string[]>*/ readLines(string fileName)
		{   /*
			using Stream fileStream = await FileSystem.Current.OpenAppPackageFileAsync(fileName);
			using StreamReader reader = new(fileStream);
			var lines = new List<String>();
			string line;
			while ((line = reader.ReadLine()) != null)
			{
				lines.Add(line);
			}
			*/
			IEnumerable<String> lines = new List<String>();
			try
			{
				lines = File.ReadAllLines(fileName);
			} catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
				Console.WriteLine(ex.StackTrace);
			}
			return lines.ToArray();
		}
	}
}

