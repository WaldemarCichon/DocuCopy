using System;
using DocuCopy.Model;

namespace DocuCopy.Algorithm
{
	public class Copier
	{
        private CopyHead copyHead;
        private ProgressBar progress;
        private ListView logs;

        public Files Files { get; private set; }

        public Copier(CopyHead copyHead, ProgressBar progress, ListView logs)
		{
			this.copyHead = copyHead;
			this.progress = progress;
			this.logs = logs;
		}

		private string[] getFileNames()
		{
			var directory = copyHead.SourceDir;
			var files = new string[0];
			try
			{
				files = Directory.GetFiles(directory);
			} catch (Exception ex)
			{
				Console.WriteLine(ex.Message);
				Console.WriteLine(ex.StackTrace);
			}
			return files;
		}

		public void doCopy()
		{
			var fileNames = getFileNames();
			Files = new Files(fileNames, copyHead);
			Files.Check();
			Files.CalcDestination();
			Files.Process(progress);
			Files.WriteLogs(logs);
		}
	}
}

