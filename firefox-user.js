/* Language */
user_pref("intl.accept_languages", "en-GB, en");

/* Turn off telemetry, studies, crash reports, etc. */
user_pref("browser.discovery.enabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false); 
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/* Turn on DNS over HTTPS always */
user_pref("network.trr.mode", 3);
user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");

/* Bookmarks Bar Always Visible */
user_pref("browser.toolbars.bookmarks.visibility", "always");

/* Serach bar in nav */
user_pref("browser.serach.widget.inNavBar", true)

/* Always view the full URL */
user_pref("browser.urlbar.trimURLs", false);

/* Block SHA-1 certs */
user_pref("security.pki.sha1_enforcement_level", 1);

/* Strictly pin with public certs */
user_pref("security.cert_pinning.enforcement_level", 2);

/* Show nothing on startup */
user_pref("browser.startup.homepage", "about:blank");

