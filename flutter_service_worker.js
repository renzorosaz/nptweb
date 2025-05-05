'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "0dadc60fabb777408966c3f580c09a23",
"version.json": "7e9076993c12f35ade675db8bc7da92e",
"index.html": "98905ff54bb01896d8a307374d9e3951",
"/": "98905ff54bb01896d8a307374d9e3951",
"main.dart.js": "f09563bb64129b30b7fea46975e1011c",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "806fef2c7c1c384e2081c91c01479ef4",
"assets/AssetManifest.json": "43819d5ab3258035ad4890cb28368ad9",
"assets/NOTICES": "de6553b2219c1b74a78daded41f809bd",
"assets/FontManifest.json": "9cd46964667b323b6a60aec079001c2a",
"assets/AssetManifest.bin.json": "53ad67e0d7b6dae513e46cc2417dada1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c8d49788132f1b8e1f05a08d9ed92bd3",
"assets/fonts/MaterialIcons-Regular.otf": "f7e9378e939e79f858ceb193a6c4aacb",
"assets/assets/images/apps.png": "d899829b5e64cb49b84c40b624daafc3",
"assets/assets/images/fondo_celulares.png": "0c9c7a1c14e3411f2c7441d67da07759",
"assets/assets/images/fondo_lineas.png": "669ac12093dfcf0dbcd541a3b1f69d8f",
"assets/assets/images/fondo_naranja.png": "d31b5b463222f2af36b846cd77b78be9",
"assets/assets/portafolio/aw_1.png": "83df2ed3735c0ba66aa85f28bfc97a3c",
"assets/assets/portafolio/aw_3.png": "413d5f4937c0e0bf10c5ca0dc69cb4e2",
"assets/assets/portafolio/aw_2.png": "2cacf89b8e70f52da3a10145e79ac614",
"assets/assets/portafolio/aw_6.png": "0d8ebbabf097011dbaf8dd7c303fdbfd",
"assets/assets/portafolio/aw_7.png": "ce151f37f0893cfebdb32c5d60eb921f",
"assets/assets/portafolio/aw_5.png": "7ad6f7966201843ac4d3c9651d7209d7",
"assets/assets/portafolio/aw_4.png": "b3de261b0320a09c74572bce4fda67f8",
"assets/assets/portafolio/aw_8.png": "8abaafe48f1769cc9f5621ee785a348b",
"assets/assets/logos/miski.png": "ab2163da42dce7d781bd9558bc49f139",
"assets/assets/logos/stef.png": "1a65e2e38fc3f0149fddd9ca4d17e08a",
"assets/assets/logos/kal.png": "4e7628b22148d13ddfc3d8fd78cf5543",
"assets/assets/logos/open.png": "8c1cdee4614e866abc70a8177a141b74",
"assets/assets/partners/python.png": "82371f3121c1169371720eb85d671fed",
"assets/assets/partners/flutter.png": "92526670826da7f8c23d12c0f6b907b2",
"assets/assets/partners/aws.png": "550748d3e0f93e1d34469165545c4a30",
"assets/assets/partners/figma.png": "f3c0c3006d61732133336966c41b2795",
"assets/assets/partners/whatsapp.png": "d9efc356b2a33afb7f05aa51ea0b3424",
"assets/assets/icons/apps.png": "3ab745847f4747ed8ea2324e4638528c",
"assets/assets/icons/cons.png": "d70c4d3076a9727a1d2833eec50f1f1e",
"assets/assets/icons/ia.png": "5e3e211f3bdebef8fe95a1368ebc2138",
"assets/assets/icons/op1.png": "c95447fa84ef78d04b7c91797254ba27",
"assets/assets/icons/op2.png": "5c81edaff343eefe80188af60956738d",
"assets/assets/icons/op3.png": "0c707816dfb38bfc7374c630193721ec",
"assets/assets/icons/risk.png": "52066c37d5c34173fb61f744da263808",
"assets/assets/icons/op4.png": "17b7ea726ec842602894cc2336e77c53",
"assets/assets/icons/op5.png": "eda37253de68364f64e3784e5bfee1fc",
"assets/assets/fonts/body/NBInternationalProIta.ttf": "b721a899ba381b2b1a3523ca431fd486",
"assets/assets/fonts/body/NBInternationalProBolIta.ttf": "f446d9bbc97e72354bfe46a5a3adecf3",
"assets/assets/fonts/body/NBInternationalProMed.ttf": "aa6841bedf0163660bf7f1dee9c96130",
"assets/assets/fonts/body/NBInternationalProLigIta.ttf": "4eaa30e742251b4635f11499378e6f42",
"assets/assets/fonts/body/NBInternationalProBoo.ttf": "ac71b5b454b81bd9bd85d89808e5163b",
"assets/assets/fonts/body/NBInternationalProReg.ttf": "d7adcc2428159971138db4d57ac996c3",
"assets/assets/fonts/body/NB%2520InternationalProLight.otf": "fb5dae1c7099b58987a36e16fe6d8f7a",
"assets/assets/fonts/body/NBInternationalProLig.ttf": "2ee2aff02b8e7104576bffb728050b6e",
"assets/assets/fonts/body/NBInternationalProBol.otf": "25647c58d0fdb3c80be5debd4802ac77",
"assets/assets/fonts/body/NBInternationalProMedIta.ttf": "88f2dbfc7355214adc5b433ce19a93b2",
"assets/assets/fonts/head/PPNeueMachina-PlainRegular.otf": "21069770d3af8a4bb1c1ee7a1df8a442",
"assets/assets/fonts/head/PPGoshaSans-Bold.otf": "eba43cd2e68d16589d6e0132f5c2962b",
"assets/assets/fonts/head/PPGoshaSans-Regular.otf": "a680daa243a46bd934d45e445ceb3309",
"assets/assets/fonts/head/PPNeueMachina-PlainUltrabold.otf": "82f613c49bca73e93073bb071f00e84c",
"assets/assets/fonts/head/PPNeueMachina-PlainLightItalic.otf": "4bc0abf0991a3c4107ae7c78b47826b5",
"assets/assets/fonts/head/PPNeueMachina-PlainLight.otf": "21a61ea951899964d9611f38b18656cc",
"assets/assets/fonts/head/PPNeueMachina-PlainRegularItalic.otf": "e3821cfc11616dbb7effcc10d2fbddab",
"assets/assets/fonts/head/PPNeueMachina-PlainUltraboldItalic.otf": "78d081a886ec51461e83fdec9850bd9e",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
