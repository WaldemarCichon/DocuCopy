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

    async void StartButton_Clicked(System.Object sender, System.EventArgs e)
    {
		var result = await FilePicker.Default.PickAsync();
		if (result != null)
		{
			var copyHead = new CopyHead(result.FullPath, this);
			var copier = new Copier(copyHead, Progress, Logs);
			copier.doCopy();
		}
    }
}


