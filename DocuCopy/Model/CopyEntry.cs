using System;
using System.Text;
using DocuCopy.Model.Enums;

namespace DocuCopy.Model
{
	public class CopyEntry
	{
		public String WildCard { get; set; }
		public String Destination { get; set; }
		public MovementKind MovementKind { get; set; }

		public int Count { get; set; }

		public Error Error { get; private set; }

		public CopyEntry(String line)
		{
			int position = 0;
			Error = Error.None;
			position = checkForMovementKind(line, position);
			position = getWildCard(line, position);
			getDestination(line, position);
		}

        private int getWildCard(string line, int startingPosition) {
			var wildCard = new StringBuilder();
			var position = startingPosition;
			var endposition = line.Length;
			while (position<endposition && line[position] != '>')
			{
				wildCard.Append(line[position++]);
			}
			WildCard = wildCard.ToString();
			return position;
        }

		private void getDestination(string line, int position)
		{
			if (line.Length > position)
			{
				Destination = line.Substring(position + 1);
			}
		}

        private int checkForMovementKind(string line, int position)
		{
			var chr = line[position];
			switch (chr)
			{
				case 'C': MovementKind = MovementKind.Copy; break;
				case 'M': MovementKind = MovementKind.Move; break;
				case 'D': MovementKind = MovementKind.Delete; break;
				default: MovementKind = MovementKind.Unknown; Error = Error.MovementPareError;  break;
			}
			if (line[1] != ' ')
			{
				Error = Error.MissingBlamc;
				return 1;
			}
			return 2;
		}


    }
}

