[Reflection.Assembly]::LoadWithPartialName("System.Web") | Out-Null
function bing {
    #Start-Process microsoft-edge:www.bing.com?q=$url;
    if($args.Length -gt 0){
        Start-Process -FilePath ("www.bing.com?q=" + $args);
    }
    else{
        Start-Process -FilePath ("www.bing.com" + $args);
    }
}

function google {
    if($args.Length -gt 0){
        Start-Process -FilePath "chrome.exe" ("www.google.com/search?q=" + ($args -join "+"));
    }
    else{
        Start-Process -FilePath "chrome.exe" ("www.google.com/ncr");
    }
}

function wiki($query) {
    if($query){
        Start-Process -FilePath ("www.wikipedia.org/wiki/" + $query);
    }
    else{
        Start-Process -FilePath ("www.wikipedia.org");
    }
}

function github {
    if($args.Length -gt 0){
        if ($args[0].Contains("/")) {
            Start-Process -FilePath ("www.github.com/" + $args[0].Replace("/", ""));
        }
        else {
            Start-Process -FilePath ("www.github.com/search?q=" + $args);
        }
    }else {
        Start-Process -FilePath ("www.github.com");
    }
}

function zhihu {
    if($args.Length -gt 0){
        Start-Process -FilePath ("www.zhihu.com/search?q=" + $args);
    }else{
        Start-Process -FilePath ("www.zhihu.com");
    }
}

function tieba($query) {
    if($query){
        Start-Process -FilePath ("https://tieba.baidu.com/f?kw=" + $query);
    }else{
        Start-Process -FilePath ("https://tieba.baidu.com");
    }
}

function stack {
    if($args.Length -gt 0){
        Start-Process -FilePath ("www.stackoverflow.com/search?q=" + $args);
    }else{
        Start-Process -FilePath ("www.stackoverflow.com");
    }
}

function jd {
    if($args.Length -gt 0){
        Start-Process -FilePath ("https://search.jd.com/Search?keyword=" + [System.Web.HttpUtility]::UrlEncode($args) + "&enc=utf-8");
    }
    else{
        Start-Process -FilePath ("https://wwww.jd.com");
    }
}

function douyu($query) {
    if($query){
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
    else{
        Start-Process -FilePath ("www.douyu.com");
    }
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