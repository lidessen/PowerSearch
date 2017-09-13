function bing($query) {
    #Start-Process microsoft-edge:www.bing.com?q=$url;
    Start-Process -FilePath ("www.bing.com?q=" + $query);
}

function google($query) {
    Start-Process -FilePath ("www.google.com/search?q=" + $query);
}

function wiki($query) {
    Start-Process -FilePath ("www.wikipedia.org/wiki/" + $query);
}

function github($query) {
    Start-Process -FilePath ("www.github.com/search?q=" + $query);
}

function zhihu($query) {
    Start-Process -FilePath ("www.zhihu.com/search?q=" + $query);
}

function tieba($query) {
    Start-Process -FilePath ("https://tieba.baidu.com/f?kw=" + $query);
}

function stack($query) {
    Start-Process -FilePath ("www.stackoverflow.com/search?q=" + $query);
}

function jd($query) {
    Start-Process -FilePath ("https://search.jd.com/Search?keyword=" + $query);
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