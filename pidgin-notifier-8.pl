#based off forward2mobile http://code.google.com/p/forward2mobile/

use Purple;
use Encode;
use Cwd;
use HTML::Entities;

%PLUGIN_INFO = (
    perl_api_version    => 2,
    name                => "pidgin-toast-8",
    version             => "0.1",
    summary             => "Display windows 8 notifications for new messages.",
    description         => "Show notifications native to windows 8 using the console-toast-8 script.",
    author              => "Adrian Keenan",
    url                 => "http://adriankeenan.co.uk",
    load                => "plugin_load",
    unload              => "plugin_unload"
);
sub plugin_init {
    return %PLUGIN_INFO;
}
sub plugin_load {
    my $plugin = shift;
    
    $convs_handle = Purple::Conversations::get_handle();
    Purple::Signal::connect($convs_handle, "receiving-im-msg", $plugin, \&got_msg, "yyy");
    Purple::Debug::info("pidgin-toast-8", "plugin_load() - Test Plugin Loaded.\n");
}
sub plugin_unload {
    my $plugin = shift;
    Purple::Debug::info("pidgin-toast-8", "plugin_unload() - Test Plugin Unloaded.\n");
}

sub got_msg {
    my ($account, $who, $msg, $conv, $flags) = @_;
    
    #get buddy name and avatar path
    @accounts = Purple::Accounts::get_all();
    for ($i = 0; $i <= $#accounts; $i++) {
        $sender = Purple::Find::buddy($accounts[$i], $who);
        if ($sender) {
            $displayName = decode_utf8($sender->get_alias());
            $iconPath = $sender->get_icon()->get_full_path();
            last;
        }
    }
    if (!$sender) {
        $displayName = $who;
        $iconPath = "";
    }

    #html decode and stip tags (only for basic html)
    $msg = decode_entities($msg);
    while ($msg =~ s/<\S[^<>]*(?:>|$)//gs) {};
    
    #show toast notification if the conversation window does not have focus
    if (!$conv->has_focus()) {
        show_toast(sprintf("%s says...", $displayName), $msg, $iconPath);
    }
}

sub show_toast {
    my($title, $body, $img) = @_;
    
    #get path to working_dir\pidgin.ico
    my $dir = getcwd;
    $dir =~ tr|/|\\|;
    my $icon = sprintf("%s\\pidgin.ico", $dir);
    
    #escape quotes in the message
    $body =~ s/"/\\"/g;
    
    #run console-toast8
    system(sprintf("console-toast-8.exe --template ToastImageAndText02 --title \"%s\" --line1 \"%s\" --img \"%s\" --icon \"%s\"", $title, $body, $img, $icon));
}