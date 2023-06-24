using DocuCopy.Algorithm;
using DocuCopy.Model;

namespace DocuCopy;

public partial class MainPage : ContentPage
{
	int count = 0;

	public MainPage()
	{
		InitializeComponent();
	}

	private void OnCounterClicked(object sender, EventArgs e)
	{
		
	}

    void StartButton_Clicked(System.Object sender, System.EventArgs e)
    {
		var copyHead = new CopyHead("DocuCopy.cfg");
		var copier = new Copier(copyHead);
		copier.doCopy();
    }
}


