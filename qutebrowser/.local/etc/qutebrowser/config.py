# Autogenerated config.py
#
# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['downloads']

# Maximum time (in minutes) between two history items for them to be
# considered being from the same browsing session. Items with less time
# between them are grouped when being displayed in `:history`. Use -1 to
# disable separation.
# Type: Int
c.history_gap_interval = 30

# When to find text on a page case-insensitively.
# Type: IgnoreCase
# Valid values:
#   - always: Search case-insensitively.
#   - never: Search case-sensitively.
#   - smart: Search case-sensitively if there are capital characters.
c.search.ignore_case = 'smart'

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
#   - tab: Open a new tab in the existing window and activate the window.
#   - tab-bg: Open a new background tab in the existing window and activate the window.
#   - tab-silent: Open a new tab in the existing window without activating the window.
#   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
#   - window: Open in a new window.
#   - private-window: Open in a new private window.
c.new_instance_open_target = 'tab'

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is set to `window`, this is ignored.
# Type: String
# Valid values:
#   - first-opened: Open new tabs in the first (oldest) opened window.
#   - last-opened: Open new tabs in the last (newest) opened window.
#   - last-focused: Open new tabs in the most recently focused window.
#   - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = 'last-focused'

# Additional arguments to pass to Qt, without leading `--`. With
# QtWebEngine, some Chromium arguments (see
# https://peter.sh/experiments/chromium-command-line-switches/ for a
# list) will work.
# Type: List of String
c.qt.args = []

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 or QT_ENABLE_HIGHDPI_SCALING=1 (Qt >=
# 5.14) in the environment. It's off by default as it can cause issues
# with some bitmap fonts. As an alternative to this, it's possible to
# set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = False

# Automatically start playing `<video>` elements. Note: On Qt < 5.11,
# this option needs a restart and does not support URL patterns.
# Type: Bool
c.content.autoplay = False

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')

# Which cookies to accept. With QtWebEngine, this setting also controls
# other features with tracking capabilities similar to those of cookies;
# including IndexedDB, DOM storage, filesystem API, service workers, and
# AppCache. Note that with QtWebKit, only `all` and `never` are
# supported as per-domain values. Setting `no-3rdparty` or `no-
# unknown-3rdparty` per-domain on QtWebKit will have the same effect as
# `all`. If this setting is used with URL patterns, the pattern gets
# applied to the origin/first party URL of the page making the request,
# not the request URL.
# Type: String
# Valid values:
#   - all: Accept all cookies.
#   - no-3rdparty: Accept cookies from the same origin only. This is known to break some sites, such as GMail.
#   - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain. On QtWebEngine, this is the same as no-3rdparty.
#   - never: Don't accept cookies at all.
config.set('content.cookies.accept', 'all', 'devtools://*')

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

# Allow websites to share screen content. On Qt < 5.10, a dialog box is
# always displayed, even if this is set to "true".
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.desktop_capture', True, 'https://discord.com')

# Allow websites to share screen content. On Qt < 5.10, a dialog box is
# always displayed, even if this is set to "true".
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.desktop_capture = 'ask'

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.geolocation = False

# Value to send in the `Accept-Language` header. Note that the value
# read from JavaScript is always the global value.
# Type: String
c.content.headers.accept_language = 'en-US,en'

# Custom headers for qutebrowser HTTP requests.
# Type: Dict
c.content.headers.custom = {}

# Value to send in the `DNT` header. When this is set to true,
# qutebrowser asks websites to not track your identity. If set to null,
# the DNT header is not sent at all.
# Type: Bool
c.content.headers.do_not_track = True

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')

# User agent to send.  The following placeholders are defined:  *
# `{os_info}`: Something like "X11; Linux x86_64". * `{webkit_version}`:
# The underlying WebKit version (set to a fixed value   with
# QtWebEngine). * `{qt_key}`: "Qt" for QtWebKit, "QtWebEngine" for
# QtWebEngine. * `{qt_version}`: The underlying Qt version. *
# `{upstream_browser_key}`: "Version" for QtWebKit, "Chrome" for
# QtWebEngine. * `{upstream_browser_version}`: The corresponding
# Safari/Chrome version. * `{qutebrowser_version}`: The currently
# running qutebrowser version.  The default value is equal to the
# unchanged user agent of QtWebKit/QtWebEngine.  Note that the value
# read from JavaScript is always the global value. With QtWebEngine
# between 5.12 and 5.14 (inclusive), changing the value exposed to
# JavaScript requires a restart.
# Type: FormatString
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')

# Enable host blocking.
# Type: Bool
c.content.host_blocking.enabled = True

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file   named `hosts` (with any extension).  It's also
# possible to add a local file or directory via a `file://` URL. In case
# of a directory, all files in the directory are read as adblock lists.
# The file `~/.config/qutebrowser/blocked-hosts` is always read if it
# exists.
# Type: List of Url
c.content.host_blocking.lists = ['https://www.malwaredomainlist.com/hostslist/hosts.txt', 'http://someonewhocares.org/hosts/hosts', 'http://winhelp2002.mvps.org/hosts.zip', 'http://malwaredomains.lehigh.edu/files/justdomains.zip', 'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext']

# A list of patterns that should always be loaded, despite being ad-
# blocked. Note this whitelists blocked hosts, not first-party URLs. As
# an example, if `example.org` loads an ad from `ads.example.org`, the
# whitelisted host should be `ads.example.org`. If you want to disable
# the adblocker on a given page, use the `content.host_blocking.enabled`
# setting with a URL pattern instead. Local domains are always exempt
# from hostblocking.
# Type: List of UrlPattern
c.content.host_blocking.whitelist = []

# Enable hyperlink auditing (`<a ping>`).
# Type: Bool
c.content.hyperlink_auditing = False

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
# Type: Bool
config.set('content.images', True, 'devtools://*')

# Allow JavaScript to read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: Bool
c.content.javascript.can_access_clipboard = False

# Allow JavaScript to open new tabs without user interaction.
# Type: Bool
c.content.javascript.can_open_tabs_automatically = False

# Enable JavaScript.
# Type: Bool
c.content.javascript.enabled = True

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Allow locally loaded documents to access remote URLs.
# Type: Bool
c.content.local_content_can_access_remote_urls = False

# Allow locally loaded documents to access other local URLs.
# Type: Bool
c.content.local_content_can_access_file_urls = True

# Enable support for HTML 5 local storage and Web SQL.
# Type: Bool
c.content.local_storage = True

# Allow websites to record audio.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.audio_capture', True, 'https://web.skype.com')

# Allow websites to record audio.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.audio_capture', True, 'https://discord.com')

# Allow websites to record video.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.video_capture', True, 'https://web.skype.com')

# Allow websites to record video.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
config.set('content.media.video_capture', True, 'https://discord.com')

# Allow websites to show notifications.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.notifications = True

# Enable plugins in Web pages.
# Type: Bool
c.content.plugins = False

# Draw the background color and images also when the page is printed.
# Type: Bool
c.content.print_element_backgrounds = True

# Open new windows in private browsing mode which does not record
# visited pages.
# Type: Bool
c.content.private_browsing = False

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL. Note that with QtWebEngine, it will
# take a couple of seconds until the change is applied, if this value is
# changed at runtime.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'system'

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.ssl_strict = 'ask'

# List of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = []

# Enable WebGL.
# Type: Bool
c.content.webgl = True

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 100

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = '30%'

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = 'auto'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = True

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 0

# Padding (in pixels) of the scrollbar handle in the completion window.
# Type: Int
c.completion.scrollbar.padding = 0

# Format of timestamps (e.g. for the history completion). See
# https://sqlite.org/lang_datefunc.html and
# https://docs.python.org/3/library/datetime.html#strftime-strptime-
# behavior for allowed substitutions, qutebrowser uses both sqlite and
# Python to format its timestamps.
# Type: String
c.completion.timestamp_format = '%Y-%m-%d'

# Minimum amount of characters needed to update completions.
# Type: Int
c.completion.min_chars = 1

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '~/downloads'

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False

# Remember the last used download directory.
# Type: Bool
c.downloads.location.remember = True

# What to display in the download filename input.
# Type: String
# Valid values:
#   - path: Show only the download path.
#   - filename: Show only download filename.
#   - both: Show download path and filename.
c.downloads.location.suggestion = 'path'

# Which categories to show (in which order) in the :open completion.
# Type: FlagList
# Valid values:
#   - searchengines
#   - quickmarks
#   - bookmarks
#   - history
c.completion.open_categories = ['quickmarks', 'bookmarks', 'history']

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 0

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined:  * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['wrapper-terminal', '-e', 'vim', '-f', '{}']

# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = 'unique-match'

# Duration (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 0

# CSS border value for hints.
# Type: String
c.hints.border = '3px solid #0B0806'

# Padding (in pixels) for hints.
# Type: Padding
c.hints.padding = {'bottom': 3, 'left': 3, 'right': 3, 'top': 3}

# Characters used for hint strings.
# Type: UniqueCharString
c.hints.chars = 'hjklasdfgyuiopqwertnmzxcvb'

# Dictionary file to be used by the word hints.
# Type: File
c.hints.dictionary = '/dev/null'

# Minimum number of characters used for hint strings.
# Type: Int
c.hints.min_chars = 1

# Mode to use for hints.
# Type: String
# Valid values:
#   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
#   - letter: Use the characters in the `hints.chars` setting.
#   - word: Use hints words based on the html elements and the extra words.
c.hints.mode = 'letter'

# Make characters in hint strings uppercase.
# Type: Bool
c.hints.uppercase = False

# When/how to show the scrollbar.
# Type: String
# Valid values:
#   - always: Always show the scrollbar.
#   - never: Never show the scrollbar.
#   - when-searching: Show the scrollbar when searching for text in the webpage. With the QtWebKit backend, this is equal to `never`.
#   - overlay: Show an overlay scrollbar. With Qt < 5.11 or on macOS, this is unavailable and equal to `when-searching`; with the QtWebKit backend, this is equal to `never`. Enabling/disabling overlay scrollbars requires a restart.
c.scrolling.bar = 'never'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Languages to use for spell checking. You can check for available
# languages and install dictionaries using scripts/dictcli.py. Run the
# script with -h/--help for instructions.
# Type: List of String
# Valid values:
#   - af-ZA: Afrikaans (South Africa)
#   - bg-BG: Bulgarian (Bulgaria)
#   - ca-ES: Catalan (Spain)
#   - cs-CZ: Czech (Czech Republic)
#   - da-DK: Danish (Denmark)
#   - de-DE: German (Germany)
#   - el-GR: Greek (Greece)
#   - en-AU: English (Australia)
#   - en-CA: English (Canada)
#   - en-GB: English (United Kingdom)
#   - en-US: English (United States)
#   - es-ES: Spanish (Spain)
#   - et-EE: Estonian (Estonia)
#   - fa-IR: Farsi (Iran)
#   - fo-FO: Faroese (Faroe Islands)
#   - fr-FR: French (France)
#   - he-IL: Hebrew (Israel)
#   - hi-IN: Hindi (India)
#   - hr-HR: Croatian (Croatia)
#   - hu-HU: Hungarian (Hungary)
#   - id-ID: Indonesian (Indonesia)
#   - it-IT: Italian (Italy)
#   - ko: Korean
#   - lt-LT: Lithuanian (Lithuania)
#   - lv-LV: Latvian (Latvia)
#   - nb-NO: Norwegian (Norway)
#   - nl-NL: Dutch (Netherlands)
#   - pl-PL: Polish (Poland)
#   - pt-BR: Portuguese (Brazil)
#   - pt-PT: Portuguese (Portugal)
#   - ro-RO: Romanian (Romania)
#   - ru-RU: Russian (Russia)
#   - sh: Serbo-Croatian
#   - sk-SK: Slovak (Slovakia)
#   - sl-SI: Slovenian (Slovenia)
#   - sq: Albanian
#   - sr: Serbian
#   - sv-SE: Swedish (Sweden)
#   - ta-IN: Tamil (India)
#   - tg-TG: Tajik (Tajikistan)
#   - tr-TR: Turkish (Turkey)
#   - uk-UA: Ukrainian (Ukraine)
#   - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = ['en-US', 'ru-RU']

# Padding (in pixels) for the statusbar.
# Type: Padding
c.statusbar.padding = {'bottom': 2, 'left': 0, 'right': 6, 'top': 2}

# Position of the status bar.
# Type: VerticalPosition
# Valid values:
#   - top
#   - bottom
c.statusbar.position = 'bottom'

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = True

# Mouse button with which to close tabs.
# Type: String
# Valid values:
#   - right: Close tabs on right-click.
#   - middle: Close tabs on middle-click.
#   - none: Don't close tabs using the mouse.
c.tabs.close_mouse_button = 'middle'

# Scaling factor for favicons in the tab bar. The tab size is unchanged,
# so big favicons also require extra `tabs.padding`.
# Type: Float
c.tabs.favicons.scale = 1.0

# When to show favicons in the tab bar.
# Type: String
# Valid values:
#   - always: Always show favicons.
#   - never: Always hide favicons.
#   - pinned: Show favicons only on pinned tabs.
c.tabs.favicons.show = 'never'

# Switch between tabs using the mouse wheel.
# Type: Bool
c.tabs.mousewheel_switching = True

# Position of new tabs opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.related = 'next'

# Position of new tabs which are not opened from another tab. See
# `tabs.new_position.stacking` for controlling stacking behavior.
# Type: NewTabPosition
# Valid values:
#   - prev: Before the current tab.
#   - next: After the current tab.
#   - first: At the beginning.
#   - last: At the end.
c.tabs.new_position.unrelated = 'last'

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 2, 'left': 6, 'right': 8, 'top': 2}

# Position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
#   - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
#   - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
#   - last-used: Select the previously selected tab.
c.tabs.select_on_remove = 'next'

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'left'

# Format to use for the tab title. The following placeholders are
# defined:  * `{perc}`: Percentage as a string like `[10%]`. *
# `{perc_raw}`: Raw percentage, e.g. `10`. * `{current_title}`: Title of
# the current web page. * `{title_sep}`: The string `" - "` if a title
# is set, empty otherwise. * `{index}`: Index of this tab. *
# `{aligned_index}`: Index of this tab padded with spaces to have the
# same   width. * `{id}`: Internal tab ID of this tab. * `{scroll_pos}`:
# Page scroll position. * `{host}`: Host of the current web page. *
# `{backend}`: Either `webkit` or `webengine` * `{private}`: Indicates
# when private mode is enabled. * `{current_url}`: URL of the current
# web page. * `{protocol}`: Protocol (http/https/...) of the current web
# page. * `{audio}`: Indicator for audio/mute status.
# Type: FormatString
c.tabs.title.format = '{audio}{index} : {current_title}'

# Format to use for the tab title for pinned tabs. The same placeholders
# like for `tabs.title.format` are defined.
# Type: FormatString
c.tabs.title.format_pinned = '{audio}{index}'

# Minimum width (in pixels) of tabs (-1 for the default minimum size
# behavior). This setting only applies when tabs are horizontal. This
# setting does not apply to pinned tabs, unless `tabs.pinned.shrink` is
# False.
# Type: Int
c.tabs.min_width = -1

# Maximum width (in pixels) of tabs (-1 for no maximum). This setting
# only applies when tabs are horizontal. This setting does not apply to
# pinned tabs, unless `tabs.pinned.shrink` is False. This setting may
# not apply properly if max_width is smaller than the minimum size of
# tab contents, or smaller than tabs.min_width.
# Type: Int
c.tabs.max_width = -1

# Width (in pixels) of the progress indicator (0 to disable).
# Type: Int
c.tabs.indicator.width = 0

# Padding (in pixels) for tab indicators.
# Type: Padding
c.tabs.indicator.padding = {'bottom': 3, 'left': 3, 'right': 3, 'top': 3}

# Shrink pinned tabs down to their contents.
# Type: Bool
c.tabs.pinned.shrink = True

# Force pinned tabs to stay at fixed URL.
# Type: Bool
c.tabs.pinned.frozen = False

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://start.duckduckgo.com/'

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` braces.  The following further
# placeholds are defined to configure how special characters in the
# search terms are replaced by safe characters (called 'quoting'):  *
# `{}` and `{semiquoted}` quote everything except slashes; this is the
# most   sensible choice for almost all search engines (for the search
# term   `slash/and&amp` this placeholder expands to `slash/and%26amp`).
# * `{quoted}` quotes all characters (for `slash/and&amp` this
# placeholder   expands to `slash%2Fand%26amp`). * `{unquoted}` quotes
# nothing (for `slash/and&amp` this placeholder   expands to
# `slash/and&amp`).  The search engine named `DEFAULT` is used when
# `url.auto_search` is turned on and something else than a URL was
# entered to be opened. Other search engines can be used by prepending
# the search engine name to the search term, e.g. `:open google
# qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://start.duckduckgo.com'

# URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

# Hide the window decoration.  This setting requires a restart on
# Wayland.
# Type: Bool
c.window.hide_decoration = True

# Format to use for the window title. The same placeholders like for
# `tabs.title.format` are defined.
# Type: FormatString
c.window.title_format = '{perc}{current_title}{title_sep}qutebrowser'

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
# Type: List of QtColor, or QtColor
c.colors.completion.fg = ['#c5c8c6', '#c5c8c6', '#c5c8c6']

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#161719'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#161719'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#c5c8c6'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#161719'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#161719'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#161719'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#161719'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#c5c8c6'

# Top border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#161719'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#161719'

# Foreground color of the matched text in the completion.
# Type: QtColor
c.colors.completion.match.fg = '#cc6666'

# Color of the scrollbar handle in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.fg = '#c5c8c6'

# Color of the scrollbar in the completion view.
# Type: QssColor
c.colors.completion.scrollbar.bg = '#161719'

# Background color for the download bar.
# Type: QssColor
c.colors.downloads.bar.bg = 'black'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#c5c8c6'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#161719'

# Font color for the matched part of hints.
# Type: QtColor
c.colors.hints.match.fg = '#cc6666'

# Text color for the keyhint widget.
# Type: QssColor
c.colors.keyhint.fg = '#c5c8c6'

# Highlight color for keys to complete the current keychain.
# Type: QssColor
c.colors.keyhint.suffix.fg = '#cc6666'

# Background color of the keyhint widget.
# Type: QssColor
c.colors.keyhint.bg = '#161719'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#c5c8c6'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#161719'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#ffffff'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#b6bd68'

# Foreground color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.fg = '#ffffff'

# Background color of the statusbar in passthrough mode.
# Type: QssColor
c.colors.statusbar.passthrough.bg = '#b294bb'

# Foreground color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.fg = '#161719'

# Foreground color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.fg = '#c5c8c6'

# Background color of the statusbar in command mode.
# Type: QssColor
c.colors.statusbar.command.bg = '#161719'

# Default foreground color of the URL in the statusbar.
# Type: QssColor
c.colors.statusbar.url.fg = '#ffffff'

# Foreground color of the URL in the statusbar on error.
# Type: QssColor
c.colors.statusbar.url.error.fg = '#cc6666'

# Foreground color of the URL in the statusbar for hovered links.
# Type: QssColor
c.colors.statusbar.url.hover.fg = '#81a2be'

# Foreground color of the URL in the statusbar on successful load
# (http).
# Type: QssColor
c.colors.statusbar.url.success.http.fg = '#b5bd68'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = '#b5bd68'

# Foreground color of the URL in the statusbar when there's a warning.
# Type: QssColor
c.colors.statusbar.url.warn.fg = '#f0c674'

# Background color of the tab bar.
# Type: QssColor
c.colors.tabs.bar.bg = '#161719'

# Color for the tab indicator on errors.
# Type: QtColor
c.colors.tabs.indicator.error = '#cc6666'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#c5c8c6'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#161719'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#c5c8c6'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#161719'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#161719'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#c5c8c6'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#161719'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#c5c8c6'

# Foreground color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.fg = '#a19782'

# Background color of pinned unselected odd tabs.
# Type: QtColor
c.colors.tabs.pinned.odd.bg = '#2f2b2a'

# Foreground color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.fg = '#a19782'

# Background color of pinned unselected even tabs.
# Type: QtColor
c.colors.tabs.pinned.even.bg = '#2f2b2a'

# Background color for webpages if unset (or empty to use the theme's
# color).
# Type: QtColor
c.colors.webpage.bg = '#161719'

# Default font families to use. Whenever "default_family" is used in a
# font setting, it's replaced with the fonts listed here. If set to an
# empty value, a system-specific monospace default is used.
# Type: List of Font, or Font
c.fonts.default_family = 'Efont Biwidth'

# Default font size to use. Whenever "default_size" is used in a font
# setting, it's replaced with the size listed here. Valid values are
# either a float value with a "pt" suffix, or an integer value with a
# "px" suffix.
# Type: String
c.fonts.default_size = '14px'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = 'default_size default_family'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'default_size default_family'

# Font used for the context menu. If set to null, the Qt default is
# used.
# Type: Font
c.fonts.contextmenu = 'default_size default_family'

# Font used for the debugging console.
# Type: Font
c.fonts.debug_console = 'default_size default_family'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = 'default_size default_family'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'default_size default_family'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = 'default_size default_family'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = 'default_size default_family'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = 'default_size default_family'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = 'default_size default_family'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'default_size default_family'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = 'default_size default_family'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = None

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = None

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = None

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = None

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = None

# Font family for fantasy fonts.
# Type: FontFamily
c.fonts.web.family.fantasy = None

# Bindings for normal mode
config.bind('z', 'hint links spawn --detach mpv {hint-url}')
