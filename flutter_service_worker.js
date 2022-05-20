'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "808049ae251d8cd8dad3140387188fa0",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"flutter.js": "0816e65a103ba8ba51b174eeeeb2cb67",
"index.html": "8a579364921d4e3242bdcee9f0ad2f36",
"/": "8a579364921d4e3242bdcee9f0ad2f36",
"favicon.png": "3f50ca7d099434e5860d4563a9d9376d",
"version.json": "e078498220a93e37c8646322baa2caaa",
"assets/images/img%2520(29).jpg": "8ef1fb3866c0ce87d2bb07455bdc799e",
"assets/images/img%2520(21).jpg": "37a8ea9bfd50ac1ac2d6c1aa03a045e3",
"assets/images/img%2520(5).jpg": "33801ae22901c279850e3e5dad94f9df",
"assets/images/img%2520(2).jpg": "286757eea03292b76d77aa4d2189077a",
"assets/images/img%2520(3).jpg": "53e71c1605e4b0ccaeeb54da2ae48ad1",
"assets/images/img%2520(10).jpg": "03cc40a4dcac7761d7edfc7230f835a6",
"assets/images/img%2520(24).jpg": "d28931818370a3f7069cdefad9d7d232",
"assets/images/img%2520(28).jpg": "d23f5bb22b48642303f78b4b01d9a5e4",
"assets/images/img%2520(14).jpg": "cbbf10bbab0e47930a286f5d169a51d3",
"assets/images/img%2520(12).jpg": "6ed141ca7f08d4735cec7edc9f7cb2e3",
"assets/images/img%2520(13).jpg": "08461b9f56b560c498fc63338337d289",
"assets/images/img%2520(17).jpg": "25d342fa6f4cabeb0a1efe4c26e5d976",
"assets/images/logo.png": "064630f4f5dc7f74a54c48c11a6eebbb",
"assets/images/img%2520(16).jpg": "079fb470d6db52ff80b901b208a80c77",
"assets/images/QR.png": "72a73c0e12cdd96898abc4ae61c6b111",
"assets/images/img%2520(26).jpg": "910dfa2fa2da74d00cd6db4adffc94e8",
"assets/images/img%2520(1).jpg": "e0304691df9bdeb3ace1c41c777873c9",
"assets/images/card1.png": "66360b358fb537baf766e86e3f44cd0e",
"assets/images/img%2520(25).jpg": "f585cadb47c4fde29c04fc34f73fd1cf",
"assets/images/img%2520(23).jpg": "e4c14ab9a67cd9f693ad7db0d2d22880",
"assets/images/img%2520(15).jpg": "0bb4a2d5163bd70b3113d050fe14ccfb",
"assets/images/img%2520(18).jpg": "ff4687b6e0fac0ee9ab290eb15d8a213",
"assets/images/img%2520(9).jpg": "00f3ea5005b8c9c02a65095c609f194d",
"assets/images/img%2520(22).jpg": "8a338e5ac1dbd3e2adabff2ff9c920f8",
"assets/images/img%2520(4).jpg": "ca184341f2c01bcbe3823529a4d19350",
"assets/images/img%2520(11).jpg": "36dbe51a032f4e8021bf9f1886e27936",
"assets/images/img%2520(27).jpg": "4620eba9deef836e3365dcfaf3eb04bd",
"assets/AssetManifest.json": "a996447ba524282d2edbbd51094589fc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/shaders/ink_sparkle.frag": "3e9b888fde77b75e86c9de5b770e1c7f",
"assets/NOTICES": "07935974c834469ae917d125b0e52caa",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"manifest.json": "10db840cf1a44afd608c951855df13ae",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
