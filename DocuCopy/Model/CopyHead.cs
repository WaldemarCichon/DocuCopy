using System;
namespace DocuCopy.Model
{
	public class CopyHead
	{
        private readonly Page page;

        public String SourceDir { get; private set; }
		public String DestDir { get; private set; }
		public String LeftDir { get; private set; }
		public List<CopyEntry> CopyEntries { get; set; } = new List<CopyEntry>();
        public string LogDir { get; internal set; }
        public List<Variable> Variables { get; set; }
		public String MainFilePath { get; }
		public String RulesFilePath { get; private set; }

		private int index;

        public CopyHead(String filePath, Page page) : this(readLines(filePath), page)
        {
			MainFilePath = filePath;
        }

        public CopyHead(String[] lines, Page page)
		{
			this.page = page;
			Variables = new List<Variable>();
			readHeader(lines);
			readRules(lines);
			var mainPage = (MainPage)page;
			//Variables.Add(new Variable { Name = "Karobau_Code", Value = mainPage.KarosseriebauCode.Text });
            //Variables.Add(new Variable { Name = "Anlagennummer", Value = mainPage.Anlagennummer.Text });
		}

		private void readHeader(String[] lines)
		{
			foreach (var line in lines)
			{
				var parts = line.Split("=");
				switch (parts[0])
				{
					case "SorceDir":
					case "Quellverzeichnis": SourceDir = parts[1]; break;
					case "DestDir":
					case "Zielverzeichnis": DestDir = parts[1]; break;
					case "LeftDir":
					case "Restverzeichnis": LeftDir = parts[1]; break;
					case "LogDir":
					case "Logverzeichnis": LogDir = parts[1]; break;
					case "RulesFilePath":
					case "Regeldatei": RulesFilePath = parts[1]; break;
					default: Variables.Add(new Variable { Name = parts[0], Value = parts[1] }); break;
				}
			}
		}

		public async void readRules(String[] lines)
		{
            if (!Directory.Exists(SourceDir))
            {
				await page.DisplayAlert("Verzeichnis-Fehler", $"Quellpfad {SourceDir} existiert nicht", "OK");
				return;
            }
            await CheckAndCreate(DestDir);
            await CheckAndCreate(LeftDir);
            await CheckAndCreate(LogDir);
            for (int i = 0; i < lines.Length; i++)
            {
                if (lines[i].Length > 0)
                {
                    CopyEntries.Add(new CopyEntry(lines[i]));
                }
            }
        }

        private async Task CheckAndCreate(string dir)
        {
			if (!Directory.Exists(dir))
			{
				try
				{
					Directory.CreateDirectory(dir);
				}
				catch (Exception ex)
				{
					await page.DisplayAlert("Fehler beim Erzeugen von Verzeichnis", $"Verzeichnis {dir} kann nicht erzeugt werden.\nUrsache: {ex.Message}", "OK");
				}
			}
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

