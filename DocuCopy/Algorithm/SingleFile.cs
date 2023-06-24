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
					case '*': filenamePos = checkWildcard(fileName, wildcard, filenamePos, wildcardPos); break;
					case '?': filenamePos++; break;
					case '+': filenamePos = Char.IsAsciiDigit(fileName[filenamePos]) ? filenamePos + 1 : -1; break;
					case '#': filenamePos = checkNumericWildcard(fileName, wildcard, filenamePos, wildcardPos); break;
                    default: filenamePos = Char.ToLower(fileName[filenamePos]) == Char.ToLower(wildcard[wildcardPos]) ? filenamePos + 1 : -1; break;
				}
				if (filenamePos == -1)
				{
					return false;
				}
				wildcardPos++;
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

        private int checkWildcard(string fileName, string wildcard, int filenamePos, int wildcardPos)
        {
            var firstChar = Char.ToLower(wildcard[++wildcardPos]);
            filenamePos++;
            var remainingLength = nextWildcardPosOrLength(wildcard, wildcardPos) - wildcardPos; // remainingLength not to the end of string but to the next wildcard
            while ((fileName.Length - filenamePos) >= remainingLength)
            {
                if (Char.ToLower(fileName[filenamePos]) == firstChar)
                {
                    return filenamePos;
                }
				filenamePos++;
            }
            return -1;
        }

        private int checkNumericWildcard(string fileName, string wildcard, int filenamePos, int wildcardPos)
        {
			var firstChar = Char.ToLower(wildcard[++wildcardPos]);
			filenamePos++;
			var remainingLength = nextWildcardPosOrLength(wildcard, wildcardPos) - wildcardPos; // remainingLength not to the end of string but to the next wildcard
			while ((fileName.Length - filenamePos) > remainingLength)
			{
				if (Char.ToLower(fileName[filenamePos]) == firstChar) 
				{
					return filenamePos;
				}
				if (!Char.IsAsciiDigit(fileName[filenamePos]))
				{
					return -1;
				}
				filenamePos++;
			}
			return -1;
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
    }
}

