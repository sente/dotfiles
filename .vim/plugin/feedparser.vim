fun MyFeed(feed)
    split
    enew
    set buftype=nofile
    python b = vim.current.buffer
    python import re
    python import urllib
    python import urllib;text = urllib.urlopen(vim.eval('a:feed')).read().decode('ascii','ignore')
    python import feedparser;f = feedparser.parse(text)
    python for i in f['items']: b.append('%s {{{1 %s' % (str(i.title), str(i.link)));
                \b.append(str(re.sub(r'<[^>]*?>', '',str(i.summary_detail.value))).split("\n"))
    setlocal  textwidth=120
    norm gggqGgg
    set foldmethod=marker
endfun

com FeedStackNew   call MyFeed("http://stackoverflow.com/feeds/tag?tagnames=python&sort=newest")
com FeedStack      call MyFeed("http://stackoverflow.com/feeds/tag/python")
com FeedSlashdot   call MyFeed("http://rss.slashdot.org/Slashdot/slashdot")
com FeedHackernews call MyFeed("http://news.ycombinator.com/rss")
com FeedReddit     call MyFeed("http://www.reddit.com/r/python.rss")
com FeedNews       call MyFeed("http://worldpress.org/feeds/topstories.xml")
