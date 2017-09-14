[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
function bing {
    #Start-Process microsoft-edge:www.bing.com?q=$url;
    Start-Process -FilePath ("www.bing.com?q=" + $args);
}

function google {
    Start-Process -FilePath "chrome.exe" ("www.google.com/search?q=" + ($args -join "+"));
}

function wiki($query) {
    Start-Process -FilePath ("www.wikipedia.org/wiki/" + $query);
}

function github {
    if($args.Contains("/")){
        Start-Process -FilePath ("www.github.com/" + $args);
    }else{
        Start-Process -FilePath ("www.github.com/search?q=" + $args);
    }
}

function zhihu {
    Start-Process -FilePath ("www.zhihu.com/search?q=" + $args);
}

function tieba($query) {
    Start-Process -FilePath ("https://tieba.baidu.com/f?kw=" + $query);
}

function stack {
    Start-Process -FilePath ("www.stackoverflow.com/search?q=" + $args);
}

function jd {
    Start-Process -FilePath ("https://search.jd.com/Search?keyword=" + [System.Web.HttpUtility]::UrlEncode($args) + "&enc=utf-8");
}

function douyu($query) {
    $raw = Get-Content -Encoding UTF8 $HOME/psconfig/douyu.json
    $rooms = ConvertFrom-Json ([string]$raw)
    $query = if ($rooms.$query) {
        $rooms.$query
    }
    else {
        $query
    }
    Start-Process -FilePath ("www.douyu.com/" + $query);
}

function edge($url) {
    if (-not $url.Contains("www")) {
        $url = "www." + $url;
    }
    #Start-Process microsoft-edge:$url;
    Start-Process -FilePath $url;
}

function chrome($url) {
    Start-Process -FilePath "chrome.exe" $url;
}