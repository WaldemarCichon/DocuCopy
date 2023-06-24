using System;
using DocuCopy.Model;

namespace DocuCopy.Algorithm
{
	public class Copier
	{
        private CopyHead copyHead;
		public Files Files { get; private set; }

        public Copier(CopyHead copyHead)
		{
			this.copyHead = copyHead;
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
			Files.Process();
			Files.WriteLogs();
		}
	}
}

