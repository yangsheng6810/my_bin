#!/bin/bash
# TAG_NEW=""
# TAG_NEW="tag:new and "
notmuch tag +sent -- $TAG_NEW \(from:yangsheng6810@gmail.com or from:styang@fastmail.com or from:styang@cs.umd.edu or from:yangsheng6810@163.com\) and not \(to:yangsheng6810@gmail.com or to:styang@fastmail.com or to:cs.umd.edu or to:yangsheng6810@163.com\)
exit 0

# Emacs and org-mode
notmuch tag +emacs +lists -new -inbox -- $TAG_NEW from:emacs-orgmode-request@gnu.org or from:noreply@emacs-china.org

# github emails
notmuch tags +github +lists -new -inbox -- $TAG_NEW from:notifications@github.com

# Relocate notmuch emails
notmuch tag +notmuch +lists -new -inbox -- $TAG_NEW from:notmuch-request@notmuchmail.org

# Relocate wsj emails
notmuch tag +wsj +lists -new -inbox -- $TAG_NEW from:Editors.Chinese@dowjones.com

# Relocate arxiv emails
notmuch tag +arxiv.org +lists -new -inbox -- $TAG_NEW from:no-reply@arXiv.org

# Archive snapraid logs
notmuch tag +logs -important -sent -- $TAG_NEW snapraid and from:yangsheng6810

# UMD emails
notmuch tag +umd -- $TAG_NEW from:umd.edu or from:cs.umd.edu

# Spot project
notmuch tag +spot +project +research -- $TAG_NEW from:sumitra@adobe.com or from:mahadik@adobe.com or from:schoudha@adobe.com

# Theory Local
notmuch tag +inbox +lists +research -- $TAG_NEW 'to:<theory-local@cs.umd.edu>'

# Financial
notmuch tag +financial -- $TAG_NEW from:ealerts.bankofamerica.com

# All remaining mails
notmuch tag +inbox -- tag:new
