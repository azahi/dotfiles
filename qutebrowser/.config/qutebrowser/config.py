# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Require a confirmation before quitting the application.
# Type: ConfirmQuit
# Valid values:
#   - always: Always show a confirmation.
#   - multiple-tabs: Show a confirmation if multiple tabs are opened.
#   - downloads: Show a confirmation if downloads are running
#   - never: Never show a confirmation.
c.confirm_quit = ['never']

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
c.new_instance_open_target = 'tab'

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is not set to `window`, this is ignored.
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

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = 'utf-8'

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

# Allow websites to record audio/video.
# Type: BoolAsk
# Valid values:
#   - true
#   - false
#   - ask
c.content.media_capture = True

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
# `socks://...` or `http://...` URL.
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
c.content.webgl = False

# Number of commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 100

# Height (in pixels or as percentage of the window) of the completion.
# Type: PercOrInt
c.completion.height = 224

# When to show the autocompletion window.
# Type: String
# Valid values:
#   - always: Whenever a completion is available.
#   - auto: Whenever a completion is requested.
#   - never: Never.
c.completion.show = 'always'

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = False

# Width (in pixels) of the scrollbar in the completion window.
# Type: Int
c.completion.scrollbar.width = 0

# Padding (in pixels) of the scrollbar handle in the completion window.
# Type: Int
c.completion.scrollbar.padding = 0

# Format of timestamps (e.g. for the history completion).
# Type: TimestampTemplate
c.completion.timestamp_format = '%Y-%m-%d'

# Directory to save downloads to. If unset, a sensible OS-specific
# default is used.
# Type: Directory
c.downloads.location.directory = '${HOME}/downloads/qutebrowser'

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

# Duration (in milliseconds) to wait before removing finished downloads.
# If set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 0

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['/usr/bin/urxvtc', '-e', '/usr/bin/vim', '-f', '{}']

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
c.statusbar.padding = {'top': 6, 'bottom': 6, 'left': 5, 'right': 5}

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
c.tabs.padding = {'top': 6, 'bottom': 6, 'left': 6, 'right': 6}

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
# `{perc_raw}`: Raw percentage, e.g. `10`. * `{title}`: Title of the
# current web page. * `{title_sep}`: The string ` - ` if a title is set,
# empty otherwise. * `{index}`: Index of this tab. * `{id}`: Internal
# tab ID of this tab. * `{scroll_pos}`: Page scroll position. *
# `{host}`: Host of the current web page. * `{backend}`: Either
# ''webkit'' or ''webengine'' * `{private}`: Indicates when private mode
# is enabled. * `{current_url}`: URL of the current web page. *
# `{protocol}`: Protocol (http/https/...) of the current web page. *
# `{audio}`: Indicator for audio/mute status.
# Type: FormatString
c.tabs.title.format = '{title}'

# Format to use for the tab title for pinned tabs. The same placeholders
# like for `tabs.title.format` are defined.
# Type: FormatString
c.tabs.title.format_pinned = '{index}'

# Padding (in pixels) for tab indicators.
# Type: Padding
c.tabs.indicator.padding = {'top': 6, 'bottom': 6, 'left': 0, 'right': 0}

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'file:///home/free/code/startpage/index.html'

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'file:///home/free/code/startpage/index.html'

# URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

# Format to use for the window title. The same placeholders like for
# `tabs.title.format` are defined.
# Type: FormatString
c.window.title_format = '{perc}{title}{title_sep}qutebrowser'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#0B0806'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = '#0B0806'

# Foreground color of completion widget category headers.
# Type: QtColor
c.colors.completion.category.fg = '#C1AB83'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = '#2F2B2A'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.top = '#2F2B2A'

# Bottom border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.border.bottom = '#2F2B2A'

# Foreground color of the selected completion item.
# Type: QtColor
c.colors.completion.item.selected.fg = '#0B0806'

# Background color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.bg = '#A19782'

# Top border color of the completion widget category headers.
# Type: QssColor
c.colors.completion.item.selected.border.top = '#A19782'

# Bottom border color of the selected completion item.
# Type: QssColor
c.colors.completion.item.selected.border.bottom = '#A19782'

# Font color for hints.
# Type: QssColor
c.colors.hints.fg = '#A19782'

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
# Type: QssColor
c.colors.hints.bg = '#0B0806'

# Foreground color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.fg = '#a19782'

# Background color of the statusbar.
# Type: QssColor
c.colors.statusbar.normal.bg = '#0b0806'

# Foreground color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.fg = '#A19782'

# Background color of the statusbar in insert mode.
# Type: QssColor
c.colors.statusbar.insert.bg = '#57553A'

# Foreground color of the URL in the statusbar on successful load
# (https).
# Type: QssColor
c.colors.statusbar.url.success.https.fg = 'white'

# Background color of the tab bar.
# Type: QtColor
c.colors.tabs.bar.bg = '#2F2B2A'

# Foreground color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.fg = '#A19782'

# Background color of unselected odd tabs.
# Type: QtColor
c.colors.tabs.odd.bg = '#2F2B2A'

# Foreground color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.fg = '#A19782'

# Background color of unselected even tabs.
# Type: QtColor
c.colors.tabs.even.bg = '#2F2B2A'

# Foreground color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.fg = '#C1AB83'

# Background color of selected odd tabs.
# Type: QtColor
c.colors.tabs.selected.odd.bg = '#0B0806'

# Foreground color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.fg = '#C1AB83'

# Background color of selected even tabs.
# Type: QtColor
c.colors.tabs.selected.even.bg = '#0B0806'

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = '"lucy tewi", "Efont Biwidth", "Misc Fixed", "Misc Fixed Wide"'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = '8pt monospace'

# Font used for the hints.
# Type: Font
c.fonts.hints = '8pt monospace'

# Font used for prompts.
# Type: Font
c.fonts.prompts = '8pt monospace'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = '"MigMix 1P", "DejaVu Sans", "Noto Sans"'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = None

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = '"MigMix 1P", "DejaVu Serif", "Noto Serif"'

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
config.bind('z', 'hint links spawn mpv {hint-url}')
