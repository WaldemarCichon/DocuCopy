using System;
namespace DocuCopy.Model
{
	public class Variable
	{
		public const Char EscapeChar = '%';
		public String Name { get; set; }
		public String Value { get; set; }
		public String SearchName => EscapeChar + Name + EscapeChar;
	}
}

