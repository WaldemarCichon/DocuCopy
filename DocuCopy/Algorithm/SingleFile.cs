using DocuCopy.Model;

namespace DocuCopy.Algorithm
{
	public class SingleFile
	{
		public String Path { get; set; }
		public String FileName => System.IO.Path.GetFileName(Path);
		public String DestinationPath { get; set; }
		public CopyEntry MatchedCopyEntry;
		private HashSet<Char> wildcards;

		public SingleFile()
		{
			wildcards = new HashSet<char>();
			wildcards.Add('*');
			wildcards.Add('#');
			wildcards.Add('?');
			wildcards.Add('+');
		}

		public bool Matches(string wildcard)
		{
			var wildcardPos = 0;
			var filenamePos = 0;
			var fileName = FileName;
			while (true)
			{
				switch (wildcard[wildcardPos])
				{
					case '*': (filenamePos, wildcardPos) = checkWildcard(fileName, wildcard, filenamePos, wildcardPos); break;
					case '?': filenamePos++; wildcardPos++; break;
					case '+': filenamePos = Char.IsAsciiDigit(fileName[filenamePos]) ? filenamePos + 1 : -1; wildcardPos++; break;
					case '#': (filenamePos, wildcardPos) = checkNumericWildcard(fileName, wildcard, filenamePos, wildcardPos); break;
                    default: filenamePos = Char.ToLower(fileName[filenamePos]) == Char.ToLower(wildcard[wildcardPos]) ? filenamePos + 1 : -1; wildcardPos++;  break;
				}
				if (filenamePos == -1)
				{
					return false;
				}
				
				if (filenamePos >= fileName.Length || wildcardPos >= wildcard.Length)
				{
					if (filenamePos >= fileName.Length && wildcardPos >= wildcard.Length)
					{
						return true;
					} else
					{
						return false;
					}
				}
			}
		}
		
        private (int filenamePos, int wildcardPos) checkWildcard(string fileName, string wildcard, int filenamePos, int wildcardPos)
        {
            filenamePos++;
			wildcardPos++;
            var remainingLength = nextWildcardPosOrLength(wildcard, wildcardPos) - wildcardPos; // remainingLength not to the end of string but to the next wildcard
            var wildCardCheckString = wildcard.Substring(wildcardPos, remainingLength).ToLower();
			var fileNameCheckString = String.Empty;
            while ((fileName.Length - filenamePos) >= remainingLength)
            {
				fileNameCheckString = fileName.Substring(filenamePos, remainingLength).ToLower();
                if (fileNameCheckString == wildCardCheckString) 
                {
                    return (filenamePos+remainingLength, wildcardPos+remainingLength);
                }
				filenamePos++;
            }
			Console.WriteLine(fileNameCheckString);
            return (-1, -1);
        }

        private (int,int) checkNumericWildcard(string fileName, string wildcard, int filenamePos, int wildcardPos)
        {
			if (!Char.IsDigit(fileName[filenamePos]))
			{
				return (-1, -1);
			}
            filenamePos++;
            var remainingLength = nextWildcardPosOrLength(wildcard, wildcardPos) - wildcardPos; // remainingLength not to the end of string but to the next wildcard
            var wildCardCheckString = wildcard.Substring(wildcardPos, remainingLength).ToLower();
            var fileNameCheckString = String.Empty;
            while ((fileName.Length - filenamePos) >= remainingLength)
            {
                fileNameCheckString = fileName.Substring(filenamePos, remainingLength).ToLower();
                if (fileNameCheckString == wildCardCheckString)
                {
                    return (filenamePos + remainingLength, wildcardPos + remainingLength);
                }
                if (!Char.IsDigit(fileName[filenamePos]))
                {
                    return (-1, -1);
                }
                filenamePos++;
            }
            Console.WriteLine(fileNameCheckString);
            return (-1, -1);
        }

        private int nextWildcardPosOrLength(string wildcard, int wildcardPos)
        {
			var length = wildcard.Length;
            while (wildcardPos < length &&  !wildcards.Contains(wildcard[wildcardPos]))
			{
				wildcardPos++;
			}
			return wildcardPos;
        }

        public override string ToString()
        {
			return Path + " " + (MatchedCopyEntry == null ? "none" : MatchedCopyEntry.WildCard + " - " + MatchedCopyEntry.MovementKind);
        }
    }
}

