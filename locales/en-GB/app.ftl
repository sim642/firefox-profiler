# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.


### Localization for the App UI of Profiler


# Naming convention for l10n IDs: "ComponentName--string-summary".
# This allows us to minimize the risk of conflicting IDs throughout the app.
# Please sort alphabetically by (component name), and
# keep strings in order of appearance.


## The following feature names must be treated as a brand. They cannot be translated.

-firefox-brand-name = Firefox
-profiler-brand-name = Firefox Profiler
-profiler-brand-short-name = Profiler
-firefox-nightly-brand-name = Firefox Nightly

## AppHeader
## This is used at the top of the homepage and other content pages.

AppHeader--app-header = <header>{ -profiler-brand-name }</header> — <subheader>Web app for { -firefox-brand-name } performance analysis</subheader>
AppHeader--github-icon =
    .title = Go to our Git repository (this opens in a new window)

## AppViewRouter
## This is used for displaying errors when loading the application.

AppViewRouter--error-unpublished = Couldn’t retrieve the profile from { -firefox-brand-name }.
AppViewRouter--error-from-file = Couldn’t read the file or parse the profile in it.
AppViewRouter--error-local = Not implemented yet.
AppViewRouter--error-public = Could not download the profile.
AppViewRouter--error-from-url = Could not download the profile.
AppViewRouter--error-compare = Could not retrieve the profiles.
# This error message is displayed when a Safari-specific error state is encountered.
# Importing profiles from URLs such as http://127.0.0.1:someport/ is not possible in Safari.
# https://profiler.firefox.com/from-url/http%3A%2F%2F127.0.0.1%3A3000%2Fprofile.json/
AppViewRouter--error-from-localhost-url-safari =
    Due to a <a>specific limitation in Safari</a>, { -profiler-brand-name } is unable
    to import profiles from the local machine in this browser. Please open 
    this page in { -firefox-brand-name } or Chrome instead.
    .title = Safari cannot import local profiles
AppViewRouter--route-not-found--home =
    .specialMessage = The URL you tried to reach was not recognised.

## CallNodeContextMenu
## This is used as a context menu for the Call Tree, Flame Graph and Stack Chart
## panels.

CallNodeContextMenu--transform-merge-function = Merge function
    .title =
        Merging a function removes it from the profile, and assigns its time to the
        function that called it. This happens anywhere the function was called in
        the tree.
CallNodeContextMenu--transform-merge-call-node = Merge node only
    .title =
        Merging a node removes it from the profile, and assigns its time to the
        function’s node that called it. It only removes the function from that
        specific part of the tree. Any other places the function was called from
        will remain in the profile.
# This is used as the context menu item title for "Focus on function" and "Focus
# on function (inverted)" transforms.
CallNodeContextMenu--transform-focus-function-title =
    Focusing on a function will remove any sample that does not include that
    function. In addition, it re-roots the call tree so that the function
    is the only root of the tree. This can combine multiple function call sites
    across a profile into one call node.
CallNodeContextMenu--transform-focus-function = Focus on function
    .title = { CallNodeContextMenu--transform-focus-function-title }
CallNodeContextMenu--transform-focus-function-inverted = Focus on function (inverted)
    .title = { CallNodeContextMenu--transform-focus-function-title }
CallNodeContextMenu--transform-focus-subtree = Focus on subtree only
    .title =
        Focusing on a subtree will remove any sample that does not include that
        specific part of the call tree. It pulls out a branch of the call tree,
        however it only does it for that single call node. All other calls
        of the function are ignored.
CallNodeContextMenu--transform-collapse-function-subtree = Collapse function
    .title =
        Collapsing a function will remove everything it called, and assign
        all of the time to the function. This can help simplify a profile that
        calls into code that does not need to be analysed.
# This is used as the context menu item to apply the "Collapse resource" transform.
# Variables:
#   $nameForResource (String) - Name of the resource to collapse.
CallNodeContextMenu--transform-collapse-resource = Collapse <strong>{ $nameForResource }</strong>
    .title =
        Collapsing a resource will flatten out all the calls to that
        resource into a single collapsed call node.
CallNodeContextMenu--transform-collapse-direct-recursion = Collapse direct recursion
    .title =
        Collapsing direct recursion removes calls that repeatedly recurse into
        the same function.
CallNodeContextMenu--transform-drop-function = Drop samples with this function
    .title =
        Dropping samples removes their time from the profile. This is useful to
        eliminate timing information that is not relevant for the analysis.
CallNodeContextMenu--expand-all = Expand all
# Searchfox is a source code indexing tool for Mozilla Firefox.
# See: https://searchfox.org/
CallNodeContextMenu--searchfox = Look up the function name on Searchfox
CallNodeContextMenu--copy-function-name = Copy function name
CallNodeContextMenu--copy-script-url = Copy script URL
CallNodeContextMenu--copy-stack = Copy stack

## CallTree
## This is the component for Call Tree panel.

CallTree--tracing-ms-total = Running Time (ms)
    .title =
        The “total” running time includes a summary of all the time where this
        function was observed to be on the stack. This includes the time where
        the function was actually running, and the time spent in the callers from
        this function.
CallTree--tracing-ms-self = Self (ms)
    .title =
        The “self” time only includes the time where the function was
        the end of the stack. If this function called into other functions,
        then the “other” functions’ time is not included. The “self” time is useful
        for understanding where time was actually spent in a program.
CallTree--samples-total = Total (samples)
    .title =
        The “total” sample count includes a summary of every sample where this
        function was observed to be on the stack. This includes the time where the
        function was actually running, and the time spent in the callers from this
        function.
CallTree--samples-self = Self
    .title =
        The “self” sample count only includes the samples where the function was
        the end of the stack. If this function called into other functions,
        then the “other” functions’ counts are not included. The “self” count is useful
        for understanding where time was actually spent in a program.
CallTree--bytes-total = Total Size (bytes)
    .title =
        The “total size” includes a summary of all of the bytes allocated or
        deallocated while this function was observed to be on the stack. This
        includes both the bytes where the function was actually running, and the
        bytes of the callers from this function.
CallTree--bytes-self = Self (bytes)
    .title =
        The “self” bytes includes the bytes allocated or deallocated while this
        function was the end of the stack. If this function called into
        other functions, then the “other” functions’ bytes are not included.
        The “self” bytes are useful for understanding where memory was actually
        allocated or deallocated in the program.

## Call tree "badges" (icons) with tooltips
##
## These inlining badges are displayed in the call tree in front of some
## functions for native code (C / C++ / Rust). They're a small "inl" icon with
## a tooltip.

# Variables:
#   $calledFunction (String) - Name of the function whose call was sometimes inlined.
CallTree--divergent-inlining-badge =
    .title = Some calls to { $calledFunction } were inlined by the compiler.
# Variables:
#   $calledFunction (String) - Name of the function whose call was inlined.
#   $outerFunction (String) - Name of the outer function into which the called function was inlined.
CallTree--inlining-badge = (inlined)
    .title = Calls to { $calledFunction } were inlined into { $outerFunction } by the compiler.

## CallTreeSidebar
## This is the sidebar component that is used in Call Tree and Flame Graph panels.

CallTreeSidebar--select-a-node = Select a node to display information about it.

## CompareHome
## This is used in the page to compare two profiles.
## See: https://profiler.firefox.com/compare/

CompareHome--instruction-title = Enter the profile URLs that you’d like to compare
CompareHome--instruction-content =
    The tool will extract the data from the selected track and range for
    each profile, and put them both on the same view to make them easy to
    compare.
CompareHome--form-label-profile1 = Profile 1:
CompareHome--form-label-profile2 = Profile 2:
CompareHome--submit-button =
    .value = Retrieve profiles

## DebugWarning
## This is displayed at the top of the analysis page when the loaded profile is
## a debug build of Firefox.

DebugWarning--warning-message =
    .message =
        This profile was recorded in a build without release optimisations.
        Performance observations might not apply to the release population.

## Details
## This is the bottom panel in the analysis UI. They are generic strings to be
## used at the bottom part of the UI.

Details--open-sidebar-button =
    .title = Open the sidebar
Details--close-sidebar-button =
    .title = Close the sidebar
Details--error-boundary-message =
    .message = Uh oh, some unknown error happened in this panel.

## Footer Links

FooterLinks--legal = Legal
FooterLinks--Privacy = Privacy
FooterLinks--Cookies = Cookies
FooterLinks--languageSwitcher--select =
    .title = Change language
FooterLinks--hide-button =
    .title = Hide footer links
    .aria-label = Hide footer links

## FullTimeline
## The timeline component of the full view in the analysis UI at the top of the
## page.

FullTimeline--graph-type = Graph type:
FullTimeline--categories-with-cpu = Categories with CPU
FullTimeline--categories = Categories
FullTimeline--stack-height = Stack height
# This string is used as the text of the track selection button.
# Displays the ratio of visible tracks count to total tracks count in the timeline.
# We have spans here to make the numbers bold.
# Variables:
#   $visibleTrackCount (Number) - Visible track count in the timeline
#   $totalTrackCount (Number) - Total track count in the timeline
FullTimeline--tracks-button = <span>{ $visibleTrackCount }</span> / <span>{ $totalTrackCount }</span> tracks

## Home page

Home--upload-from-file-input-button = Load a profile from file
Home--upload-from-url-button = Load a profile from a URL
Home--load-from-url-submit-button =
    .value = Load
Home--documentation-button = Documentation
Home--menu-button = Enable { -profiler-brand-name } Menu Button
Home--menu-button-instructions =
    Enable the profiler menu button to start recording a performance
    profile in { -firefox-brand-name }, then analyse it and share it with profiler.firefox.com.
# The word WebChannel should not be translated.
# This message can be seen on https://main--perf-html.netlify.app/ in the tooltip
# of the "Enable Firefox Profiler menu button" button.
Home--enable-button-unavailable =
    .title = This profiler instance was unable to connect to the WebChannel, so it cannot enable the profiler menu button.
# The word WebChannel, the pref name, and the string "about:config" should not be translated.
# This message can be seen on https://main--perf-html.netlify.app/ .
Home--web-channel-unavailable =
    This profiler instance was unable to connect to the WebChannel. This usually means that it’s
    running on a different host from the one that is specified in the preference
    <code>devtools.performance.recording.ui-base-url</code>. If you would like to capture new
    profiles with this instance, and give it programmatic control of the profiler menu button,
    you can go to <code>about:config</code> and change the preference.
Home--record-instructions =
    To start profiling, click on the profiling button, or use the
    keyboard shortcuts. The icon is blue when a profile is recording.
    Hit <kbd>Capture</kbd> to load the data into profiler.firefox.com.
Home--instructions-title = How to view and record profiles
Home--instructions-content =
    Recording performance profiles requires <a>{ -firefox-brand-name }</a>.
    However, existing profiles can be viewed in any modern browser.
Home--record-instructions-start-stop = Stop and start profiling
Home--record-instructions-capture-load = Capture and load profile
Home--profiler-motto = Capture a performance profile. Analyse it. Share it. Make the web faster.
Home--additional-content-title = Load existing profiles
Home--additional-content-content = You can <strong>drag and drop</strong> a profile file here to load it, or:
Home--compare-recordings-info = You can also compare recordings. <a>Open the comparing interface.</a>
Home--recent-uploaded-recordings-title = Recent uploaded recordings

## IdleSearchField
## The component that is used for all the search inputs in the application.

IdleSearchField--search-input =
    .placeholder = Enter filter terms

## JsTracerSettings
## JSTracer is an experimental feature and it's currently disabled. See Bug 1565788.

JsTracerSettings--show-only-self-time = Show only self time
    .title = Show only the time spent in a call node, ignoring its children.

## ListOfPublishedProfiles
## This is the component that displays all the profiles the user has uploaded.
## It's displayed both in the homepage and in the uploaded recordings page.

# This string is used on the tooltip of the published profile links.
# Variables:
#   $smallProfileName (String) - Shortened name for the published Profile.
ListOfPublishedProfiles--published-profiles-link =
    .title = Click here to load profile { $smallProfileName }
ListOfPublishedProfiles--published-profiles-delete-button-disabled = Delete
    .title = This profile cannot be deleted because we lack the authorisation information.
ListOfPublishedProfiles--uploaded-profile-information-list-empty = No profile has been uploaded yet!
# This string is used below the 'Recent uploaded recordings' list section.
# Variables:
#   $profilesRestCount (Number) - Remaining numbers of the uploaded profiles which are not listed under 'Recent uploaded recordings'.
ListOfPublishedProfiles--uploaded-profile-information-label = See and manage all your recordings ({ $profilesRestCount } more)
# Depending on the number of uploaded profiles, the message is different.
# Variables:
#   $uploadedProfileCount (Number) - Total numbers of the uploaded profiles.
ListOfPublishedProfiles--uploaded-profile-information-list =
    { $uploadedProfileCount ->
        [one] Manage this recording
       *[other] Manage these recordings
    }

## MarkerContextMenu
## This is used as a context menu for the Marker Chart, Marker Table and Network
## panels.

MarkerContextMenu--set-selection-from-duration = Set selection from marker’s duration
MarkerContextMenu--start-selection-here = Start selection here
MarkerContextMenu--end-selection-here = End selection here
MarkerContextMenu--start-selection-at-marker-start = Start selection at marker’s <strong>start</strong>
MarkerContextMenu--start-selection-at-marker-end = Start selection at marker’s <strong>end</strong>
MarkerContextMenu--end-selection-at-marker-start = End selection at marker’s <strong>start</strong>
MarkerContextMenu--end-selection-at-marker-end = End selection at marker’s <strong>end</strong>
MarkerContextMenu--copy-description = Copy description
MarkerContextMenu--copy-call-stack = Copy call stack
MarkerContextMenu--copy-url = Copy URL
MarkerContextMenu--copy-page-url = Copy page URL
MarkerContextMenu--copy-as-json = Copy as JSON
# This string is used on the marker context menu item when right clicked on an
# IPC marker.
# Variables:
#   $threadName (String) - Name of the thread that will be selected.
MarkerContextMenu--select-the-receiver-thread = Select the receiver thread “<strong>{ $threadName }</strong>”
# This string is used on the marker context menu item when right clicked on an
# IPC marker.
# Variables:
#   $threadName (String) - Name of the thread that will be selected.
MarkerContextMenu--select-the-sender-thread = Select the sender thread “<strong>{ $threadName }</strong>”

## MarkerSettings
## This is used in all panels related to markers.

MarkerSettings--panel-search =
    .label = Filter Markers:
    .title = Only display markers that match a certain name

## MarkerSidebar
## This is the sidebar component that is used in Marker Table panel.

MarkerSidebar--select-a-marker = Select a marker to display information about it.

## MarkerTable
## This is the component for Marker Table panel.

MarkerTable--start = Start
MarkerTable--duration = Duration
MarkerTable--type = Type
MarkerTable--description = Description

## MenuButtons
## These strings are used for the buttons at the top of the profile viewer.

MenuButtons--index--metaInfo-button =
    .label = Profile Info
MenuButtons--index--full-view = Full View
MenuButtons--index--cancel-upload = Cancel Upload
MenuButtons--index--share-upload =
    .label = Upload Local Profile
MenuButtons--index--share-re-upload =
    .label = Re-upload
MenuButtons--index--share-error-uploading =
    .label = Error uploading
MenuButtons--index--revert = Revert to Original Profile
MenuButtons--index--docs = Docs
MenuButtons--permalink--button =
    .label = Permalink

## MetaInfo panel
## These strings are used in the panel containing the meta information about
## the current profile.

MenuButtons--index--profile-info-uploaded-label = Uploaded:
MenuButtons--index--profile-info-uploaded-actions = Delete
MenuButtons--index--metaInfo-subtitle = Profile Information
MenuButtons--metaInfo--symbols = Symbols:
MenuButtons--metaInfo--profile-symbolicated = Profile is symbolicated
MenuButtons--metaInfo--profile-not-symbolicated = Profile is not symbolicated
MenuButtons--metaInfo--resymbolicate-profile = Re-symbolicate profile
MenuButtons--metaInfo--symbolicate-profile = Symbolicate profile
MenuButtons--metaInfo--attempting-resymbolicate = Attempting to re-symbolicate profile
MenuButtons--metaInfo--currently-symbolicating = Currently symbolicating profile
MenuButtons--metaInfo--cpu = CPU:
# This string is used when we have the information about both physical and
# logical CPU cores.
# Variable:
#   $physicalCPUs (Number), $logicalCPUs (Number) - Number of Physical and Logical CPU Cores
MenuButtons--metaInfo--physical-and-logical-cpu =
    { $physicalCPUs ->
        [one] { $physicalCPUs } physical core
       *[other] { $physicalCPUs } physical cores
    }, { $logicalCPUs ->
        [one] { $logicalCPUs } logical core
       *[other] { $logicalCPUs } logical cores
    }
# This string is used when we only have the information about the number of
# physical CPU cores.
# Variable:
#   $physicalCPUs (Number) - Number of Physical CPU Cores
MenuButtons--metaInfo--physical-cpu =
    { $physicalCPUs ->
        [one] { $physicalCPUs } physical core
       *[other] { $physicalCPUs } physical cores
    }
# This string is used when we only have the information only the number of
# logical CPU cores.
# Variable:
#   $logicalCPUs (Number) - Number of logical CPU Cores
MenuButtons--metaInfo--logical-cpu =
    { $logicalCPUs ->
        [one] { $logicalCPUs } logical core
       *[other] { $logicalCPUs } logical cores
    }
MenuButtons--metaInfo--main-process-started = Main process started:
MenuButtons--metaInfo--interval = Interval:
MenuButtons--metaInfo--buffer-capacity = Buffer Capacity:
MenuButtons--metaInfo--buffer-duration = Buffer Duration:
# Buffer Duration in Seconds in Meta Info Panel
# Variable:
#   $configurationDuration (Number) - Configuration Duration in Seconds
MenuButtons--metaInfo--buffer-duration-seconds =
    { $configurationDuration ->
        [one] { $configurationDuration } second
       *[other] { $configurationDuration } seconds
    }
# Adjective refers to the buffer duration
MenuButtons--metaInfo--buffer-duration-unlimited = Unlimited
MenuButtons--metaInfo--application = Application
MenuButtons--metaInfo--name-and-version = Name and version:
MenuButtons--metaInfo--update-channel = Update Channel:
MenuButtons--metaInfo--build-id = Build ID:
MenuButtons--metaInfo--build-type = Build Type:

## Strings refer to specific types of builds, and should be kept in English.

MenuButtons--metaInfo--build-type-debug = Debug
MenuButtons--metaInfo--build-type-opt = Opt

##

MenuButtons--metaInfo--platform = Platform
MenuButtons--metaInfo--device = Device:
# OS means Operating System. This describes the platform a profile was captured on.
MenuButtons--metaInfo--os = OS:
# ABI means Application Binary Interface. This describes the platform a profile was captured on.
MenuButtons--metaInfo--abi = ABI:
MenuButtons--metaInfo--visual-metrics = Visual Metrics
MenuButtons--metaInfo--speed-index = Speed Index:
# “Perceptual” is the name of an index provided by sitespeed.io, and should be kept in English.
MenuButtons--metaInfo--perceptual-speed-index = Perceptual Speed Index:
# “Contentful” is the name of an index provided by sitespeed.io, and should be kept in English.
MenuButtons--metaInfo--contentful-speed-Index = Contentful Speed Index:
MenuButtons--metaInfo-renderRowOfList-label-features = Features:
MenuButtons--metaInfo-renderRowOfList-label-threads-filter = Threads Filter:
MenuButtons--metaInfo-renderRowOfList-label-extensions = Extensions:

## Overhead refers to the additional resources used to run the profiler.
## These strings are displayed at the bottom of the "Profile Info" panel.

MenuButtons--metaOverheadStatistics-subtitle = { -profiler-brand-short-name } Overhead
MenuButtons--metaOverheadStatistics-mean = Mean
MenuButtons--metaOverheadStatistics-max = Max
MenuButtons--metaOverheadStatistics-min = Min
MenuButtons--metaOverheadStatistics-statkeys-overhead = Overhead
    .title = Time to sample all threads.
MenuButtons--metaOverheadStatistics-statkeys-cleaning = Cleaning
    .title = Time to discard expired data.
MenuButtons--metaOverheadStatistics-statkeys-counter = Counter
    .title = Time to gather all counters.
MenuButtons--metaOverheadStatistics-statkeys-interval = Interval
    .title = Observed interval between two samples.
MenuButtons--metaOverheadStatistics-statkeys-lockings = Lockings
    .title = Time to acquire the lock before sampling.
MenuButtons--metaOverheadStatistics-overhead-duration = Overhead Durations:
MenuButtons--metaOverheadStatistics-overhead-percentage = Overhead Percentage:
MenuButtons--metaOverheadStatistics-profiled-duration = Profiled Duration:

## Publish panel
## These strings are used in the publishing panel.

MenuButtons--publish--renderCheckbox-label-hidden-threads = Include hidden threads
MenuButtons--publish--renderCheckbox-label-include-other-tabs = Include the data from other tabs
MenuButtons--publish--renderCheckbox-label-hidden-time = Include hidden time range
MenuButtons--publish--renderCheckbox-label-include-screenshots = Include screenshots
MenuButtons--publish--renderCheckbox-label-resource = Include resource URLs and paths
MenuButtons--publish--renderCheckbox-label-extension = Include extension information
MenuButtons--publish--renderCheckbox-label-preference = Include preference values
MenuButtons--publish--renderCheckbox-label-private-browsing = Include the data from private browsing windows
MenuButtons--publish--renderCheckbox-label-private-browsing-warning-image =
    .title = This profile contains private browsing data
MenuButtons--publish--reupload-performance-profile = Re-upload Performance Profile
MenuButtons--publish--share-performance-profile = Share Performance Profile
MenuButtons--publish--info-description = Upload your profile and make it accessible to anyone with the link.
MenuButtons--publish--info-description-default = By default, your personal data is removed.
MenuButtons--publish--info-description-firefox-nightly2 = This profile is from { -firefox-nightly-brand-name }, so by default most information is included.
MenuButtons--publish--include-additional-data = Include additional data that may be identifiable
MenuButtons--publish--button-upload = Upload
MenuButtons--publish--upload-title = Uploading profile…
MenuButtons--publish--cancel-upload = Cancel Upload
MenuButtons--publish--message-something-went-wrong = Uh oh, something went wrong when uploading the profile.
MenuButtons--publish--message-try-again = Try again
MenuButtons--publish--download = Download
MenuButtons--publish--compressing = Compressing…

## NetworkSettings
## This is used in the network chart.

NetworkSettings--panel-search =
    .label = Filter Networks:
    .title = Only display network requests that match a certain name

## Timestamp formatting primitive

# This displays a date in a shorter rendering, depending on the proximity of the
# date from the current date. You can look in src/utils/l10n-ftl-functions.js
# for more information.
# This is especially used in the list of published profiles panel.
# There shouldn't need to change this in translations, but having it makes the
# date pass through Fluent to be properly localized.
# The function SHORTDATE is specific to the profiler. It changes the rendering
# depending on the proximity of the date from the current date.
# Variables:
#   $date (Date) - The date to display in a shorter way
NumberFormat--short-date = { SHORTDATE($date) }

## PanelSearch
## The component that is used for all the search input hints in the application.

PanelSearch--search-field-hint = Did you know you can use the comma (,) to search using several terms?

## Profile Delete Button

# This string is used on the tooltip of the published profile links delete button in uploaded recordings page.
# Variables:
#   $smallProfileName (String) - Shortened name for the published Profile.
ProfileDeleteButton--delete-button =
    .label = Delete
    .title = Click here to delete the profile { $smallProfileName }

## Profile Delete Panel
## This panel is displayed when the user clicks on the Profile Delete Button,
## it's a confirmation dialog.

# This string is used when there's an error while deleting a profile. The link
# will show the error message when hovering.
ProfileDeletePanel--delete-error = An error happened while deleting this profile. <a>Hover to know more.</a>
# This is the title of the dialog
# Variables:
#   $profileName (string) - Some string that identifies the profile
ProfileDeletePanel--dialog-title = Delete { $profileName }
ProfileDeletePanel--dialog-confirmation-question =
    Are you sure you want to delete uploaded data for this profile? Links
    that were previously shared will no longer work.
ProfileDeletePanel--dialog-cancel-button =
    .value = Cancel
ProfileDeletePanel--dialog-delete-button =
    .value = Delete
# This is used inside the Delete button after the user has clicked it, as a cheap
# progress indicator.
ProfileDeletePanel--dialog-deleting-button =
    .value = Deleting…
# This message is displayed when a profile has been successfully deleted.
ProfileDeletePanel--message-success = The uploaded data was successfully deleted.

## ProfileFilterNavigator
## This is used at the top of the profile analysis UI.

# This string is used on the top left side of the profile analysis UI as the
# "Full Range" button. In the profiler UI, it's possible to zoom in to a time
# range. This button reverts it back to the full range. It also includes the
# duration of the full range.
# Variables:
#   $fullRangeDuration (String) - The duration of the full profile data.
ProfileFilterNavigator--full-range-with-duration = Full Range ({ $fullRangeDuration })

## Profile Loader Animation

ProfileLoaderAnimation--loading-unpublished = Importing the profile directly from { -firefox-brand-name }…
ProfileLoaderAnimation--loading-from-file = Reading the file and processing the profile…
ProfileLoaderAnimation--loading-local = Not implemented yet.
ProfileLoaderAnimation--loading-public = Downloading and processing the profile…
ProfileLoaderAnimation--loading-from-url = Downloading and processing the profile…
ProfileLoaderAnimation--loading-compare = Reading and processing profiles…
ProfileLoaderAnimation--loading-view-not-found = View not found

## ProfileRootMessage

ProfileRootMessage--title = { -profiler-brand-name }
ProfileRootMessage--additional = Back to home

## ServiceWorkerManager
## This is the component responsible for handling the service worker installation
## and update. It appears at the top of the UI.

ServiceWorkerManager--installing-button = Installing…
ServiceWorkerManager--pending-button = Apply and reload
ServiceWorkerManager--installed-button = Reload the application
ServiceWorkerManager--updated-while-not-ready =
    A new version of the application was applied before this page
    was fully loaded. You might see malfunctions.
ServiceWorkerManager--new-version-is-ready = A new version of the application has been downloaded and is ready to use.
ServiceWorkerManager--hide-notice-button =
    .title = Hide the reload notice
    .aria-label = Hide the reload notice

## StackSettings
## This is the settings component that is used in Call Tree, Flame Graph and Stack
## Chart panels. It's used to switch between different views of the stack.

StackSettings--implementation-all-stacks = All stacks
StackSettings--implementation-javascript = JavaScript
StackSettings--implementation-native = Native
StackSettings--use-data-source-label = Data source:
StackSettings--call-tree-strategy-timing = Timings
    .title = Summarise using sampled stacks of executed code over time
StackSettings--call-tree-strategy-js-allocations = JavaScript Allocations
    .title = Summarise using bytes of JavaScript allocated (no de-allocations)
StackSettings--call-tree-strategy-native-retained-allocations = Retained Memory
    .title = Summarise using bytes of memory that were allocated, and never freed in the current preview selection
StackSettings--call-tree-native-allocations = Allocated Memory
    .title = Summarise using bytes of memory allocated
StackSettings--call-tree-strategy-native-deallocations-memory = Deallocated Memory
    .title = Summarise using bytes of memory deallocated, by the site where the memory was allocated
StackSettings--call-tree-strategy-native-deallocations-sites = Deallocation Sites
    .title = Summarise using bytes of memory deallocated, by the site where the memory was deallocated
StackSettings--invert-call-stack = Invert call stack
    .title = Sort by the time spent in a call node, ignoring its children.
StackSettings--show-user-timing = Show user timing
StackSettings--panel-search =
    .label = Filter stacks:
    .title = Only display stacks which contain a function whose name matches this substring

## Tab Bar for the bottom half of the analysis UI.

TabBar--calltree-tab = Call Tree
TabBar--flame-graph-tab = Flame Graph
TabBar--stack-chart-tab = Stack Chart
TabBar--marker-chart-tab = Marker Chart
TabBar--marker-table-tab = Marker Table
TabBar--network-tab = Network
TabBar--js-tracer-tab = JS Tracer

## TrackContextMenu
## This is used as a context menu for timeline to organize the tracks in the
## analysis UI.

TrackContextMenu--only-show-this-process = Only show this process
# This is used as the context menu item to show only the given track.
# Variables:
#   $trackName (String) - Name of the selected track to isolate.
TrackContextMenu--only-show-track = Only show “{ $trackName }”
TrackContextMenu--hide-other-screenshots-tracks = Hide other Screenshots tracks
# This is used as the context menu item to hide the given track.
# Variables:
#   $trackName (String) - Name of the selected track to hide.
TrackContextMenu--hide-track = Hide “{ $trackName }”
TrackContextMenu--show-all-tracks = Show all tracks
# This is used in the tracks context menu as a button to show all the tracks
# that match the search filter.
TrackContextMenu--show-all-matching-tracks = Show all matching tracks
# This is used in the tracks context menu as a button to hide all the tracks
# that match the search filter.
TrackContextMenu--hide-all-matching-tracks = Hide all matching tracks
# This is used in the tracks context menu when the search filter doesn't match
# any track.
# Variables:
#   $searchFilter (String) - The search filter string that user enters.
TrackContextMenu--no-results-found = No results found for “<span>{ $searchFilter }</span>”

## TrackMemoryGraph
## This is used to show the memory graph of that process in the timeline part of
## the UI. To learn more about it, visit:
## https://profiler.firefox.com/docs/#/./memory-allocations?id=memory-track

TrackMemoryGraph--relative-memory-at-this-time = relative memory at this time
TrackMemoryGraph--memory-range-in-graph = memory range in graph
TrackMemoryGraph--operations-since-the-previous-sample = operations since the previous sample

## TrackPowerGraph
## This is used to show the power used by the CPU and other chips in a computer,
## graphed over time.
## It's not displayed by default in the UI, but an example can be found at
## https://share.firefox.dev/3a1fiT7.

# This is used in the tooltip when the power value uses the Watt unit.
# Variables:
#   $value (String) - the power value at this location
TrackPowerGraph--tooltip-power-watt = Power: <em>{ $value } W</em>
# This is used in the tooltip when the power value uses the Milliwatt unit.
# Variables:
#   $value (String) - the power value at this location
TrackPowerGraph--tooltip-power-milliwatt = Power: <em>{ $value } mW</em>

## TrackSearchField
## The component that is used for the search input in the track context menu.

TrackSearchField--search-input =
    .placeholder = Enter filter terms
    .title = Only display tracks that match a certain text

## TransformNavigator
## Navigator for the applied transforms in the Call Tree, Flame Graph, and Stack
## Chart components.
## These messages are displayed above the table / graph once the user selects to
## apply a specific transformation function to a node in the call tree. It's the
## name of the function, followed by the node's name.
## To learn more about them, visit:
## https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=transforms

# Root item in the transform navigator.
# "Complete" is an adjective here, not a verb.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=collapse
# Variables:
#   $item (String) - Name of the current thread. E.g.: Web Content.
TransformNavigator--complete = Complete “{ $item }”
# "Collapse resource" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=collapse
# Variables:
#   $item (String) - Name of the resource that collapsed. E.g.: libxul.so.
TransformNavigator--collapse-resource = Collapse: { $item }
# "Focus subtree" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=focus
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--focus-subtree = Focus Node: { $item }
# "Focus function" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=focus
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--focus-function = Focus: { $item }
# "Merge call node" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=merge
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--merge-call-node = Merge Node: { $item }
# "Merge function" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=merge
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--merge-function = Merge: { $item }
# "Drop function" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=drop
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--drop-function = Drop: { $item }
# "Collapse direct recursion" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=collapse
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--collapse-direct-recursion = Collapse recursion: { $item }
# "Collapse function subtree" transform.
# See: https://profiler.firefox.com/docs/#/./guide-filtering-call-trees?id=collapse
# Variables:
#   $item (String) - Name of the function that transform applied to.
TransformNavigator--collapse-function-subtree = Collapse subtree: { $item }

## Source code view in a box at the bottom of the UI.

# Displayed while the source view is waiting for the network request which
# delivers the source code.
# Variables:
#   $host (String) - The "host" part of the URL, e.g. hg.mozilla.org
SourceView--loading-url = Waiting for { $host }…
# Displayed while the source view is waiting for the browser to deliver
# the source code.
SourceView--loading-browser-connection = Waiting for { -firefox-brand-name }…
# Displayed whenever the source view was not able to get the source code for
# a file.
SourceView--source-not-available-title = Source not available
# Displayed whenever the source view was not able to get the source code for
# a file.
# Elements:
#   <a>link text</a> - A link to the github issue about supported scenarios.
SourceView--source-not-available-text = See <a>issue #3741</a> for supported scenarios and planned improvements.
# Displayed below SourceView--cannot-obtain-source, if the profiler does not
# know which URL to request source code from.
SourceView--no-known-cors-url = There is no known cross-origin-accessible URL for this file.
# Displayed below SourceView--cannot-obtain-source, if there was a network error
# when fetching the source code for a file.
# Variables:
#   $url (String) - The URL which we tried to get the source code from
#   $networkErrorMessage (String) - The raw internal error message that was encountered by the network request, not localized
SourceView--network-error-when-obtaining-source = There was a network error when fetching the URL { $url }: { $networkErrorMessage }
# Displayed below SourceView--cannot-obtain-source, if the browser could not
# be queried for source code using the symbolication API.
# Variables:
#   $browserConnectionErrorMessage (String) - The raw internal error message, not localized
SourceView--browser-connection-error-when-obtaining-source = Could not query the browser’s symbolication API: { $browserConnectionErrorMessage }
# Displayed below SourceView--cannot-obtain-source, if the browser was queried
# for source code using the symbolication API, and this query returned an error.
# Variables:
#   $apiErrorMessage (String) - The raw internal error message from the API, not localized
SourceView--browser-api-error-when-obtaining-source = The browser’s symbolication API returned an error: { $apiErrorMessage }
# Displayed below SourceView--cannot-obtain-source, if a symbol server which is
# running locally was queried for source code using the symbolication API, and
# this query returned an error.
# Variables:
#   $apiErrorMessage (String) - The raw internal error message from the API, not localized
SourceView--local-symbol-server-api-error-when-obtaining-source = The local symbol server’s symbolication API returned an error: { $apiErrorMessage }
# Displayed below SourceView--cannot-obtain-source, if a file could not be found in
# an archive file (.tar.gz) which was downloaded from crates.io.
# Variables:
#   $url (String) - The URL from which the "archive" file was downloaded.
#   $pathInArchive (String) - The raw path of the member file which was not found in the archive.
SourceView--not-in-archive-error-when-obtaining-source = The file { $pathInArchive } was not found in the archive from { $url }.
# Displayed below SourceView--cannot-obtain-source, if the file format of an
# "archive" file was not recognized. The only supported archive formats at the
# moment are .tar and .tar.gz, because that's what crates.io uses for .crates files.
# Variables:
#   $url (String) - The URL from which the "archive" file was downloaded.
#   $parsingErrorMessage (String) - The raw internal error message during parsing, not localized
SourceView--archive-parsing-error-when-obtaining-source = The archive at { $url } could not be parsed: { $parsingErrorMessage }
SourceView--close-button =
    .title = Close the source view

## UploadedRecordingsHome
## This is the page that displays all the profiles that user has uploaded.
## See: https://profiler.firefox.com/uploaded-recordings/

UploadedRecordingsHome--title = Uploaded Recordings
