'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "40b2ff8c5c95e3d3f41ecaacf50a0d14",
"assets/AssetManifest.bin.json": "044e0e58eb02267dafd5b7d68cb283cc",
"assets/AssetManifest.json": "6e76a39cecca9b4db70a4a7ddbd52b14",
"assets/assets/backgrounds/main.png": "508dbf605a87e593042a269038ed26f0",
"assets/assets/card_icons/accessory_16.png": "310da1802f61a896c1900d3c8a1ef063",
"assets/assets/card_icons/accessory_32.png": "f30905c18153a315af1ac57510e8e169",
"assets/assets/card_icons/consumable_16.png": "20c7a6702c231cc8acf65e0c526fb408",
"assets/assets/card_icons/consumable_32.png": "4328370872050bffbfe328e4d9c031b4",
"assets/assets/card_icons/monster_16.png": "6183f850714367e0a3f97d9c59f87acb",
"assets/assets/card_icons/monster_32.png": "2edb58b468a72351bca284700495359e",
"assets/assets/card_icons/weapon_16.png": "0064ec92dfd2a22344226207c2959fdb",
"assets/assets/card_icons/weapon_32.png": "40e5c28b858de1738f4dab1ab0437445",
"assets/assets/card_sprites/accessories/a.png": "2ee425aedf96fda76854d04332bfc17f",
"assets/assets/card_sprites/accessories/b.png": "5bb18247d44f8b2b61fa79b917930dbc",
"assets/assets/card_sprites/accessories/c.png": "6f854be3528a69f163536b58f63cc78d",
"assets/assets/card_sprites/accessories/d.png": "9d56b406070f6f6fd77cd2816a81cbc3",
"assets/assets/card_sprites/accessories/e.png": "ef73fda9d9a90c00f382be4369ca5277",
"assets/assets/card_sprites/accessories/f.png": "06aea0f50b7d1a5a6260762fb48d9816",
"assets/assets/card_sprites/accessories/g.png": "210017024d32639a01fbc5dc46366abf",
"assets/assets/card_sprites/consumables/2.png": "177fd807210deb01645697f7691f4663",
"assets/assets/card_sprites/consumables/3.png": "1c6b697d5e79c41bb0e87a309833c9e1",
"assets/assets/card_sprites/consumables/4.png": "280d0eed470c35b3a06fae7837eb725b",
"assets/assets/card_sprites/consumables/5.png": "43c2b81346c01d47d82898e68a5ad65c",
"assets/assets/card_sprites/consumables/6.png": "29ea2d76e281d8f3b91cc214e4c27837",
"assets/assets/card_sprites/consumables/7.png": "3a03738e22bcd72398fc499fe793df98",
"assets/assets/card_sprites/consumables/8.png": "7c10d0ff94fc8e5d96fc4c84bcc5cc33",
"assets/assets/card_sprites/monsters/10_1.png": "ca8dc4d4d8912d342889b78d838e111a",
"assets/assets/card_sprites/monsters/10_2.png": "3d1019229a3cde5a97716268e35365a3",
"assets/assets/card_sprites/monsters/11_1.png": "e35da4a4a2cf95a05e25f81013aee95c",
"assets/assets/card_sprites/monsters/11_2.png": "984b08a0e0380267dc96859ecba63063",
"assets/assets/card_sprites/monsters/12_1.png": "287d29aec920b06743255ffa34063208",
"assets/assets/card_sprites/monsters/12_2.png": "0b60b7835d1e6ba46962dcf8760343ea",
"assets/assets/card_sprites/monsters/13_1.png": "315ff1d428dca5315294ffd67bc80186",
"assets/assets/card_sprites/monsters/13_2.png": "08b244508bc56eb217c440b9735dbd94",
"assets/assets/card_sprites/monsters/14_1.png": "196869559847a6646643c7e98f884d9e",
"assets/assets/card_sprites/monsters/14_2.png": "c9473856d2b01a1cbaceaa6ed44e6210",
"assets/assets/card_sprites/monsters/2_1.png": "6fe42eddbd8e33dc48a333b6aa9ed5f1",
"assets/assets/card_sprites/monsters/2_2.png": "f264cc94477793ed12d989694e37da95",
"assets/assets/card_sprites/monsters/3_1.png": "43f516c4d61d85453ceec7ed9ec01ed7",
"assets/assets/card_sprites/monsters/3_2.png": "e2269d8fc3ead847fc81ed152b552893",
"assets/assets/card_sprites/monsters/4_1.png": "766435dcdfa1fca6f4bf94b3f041b0a9",
"assets/assets/card_sprites/monsters/4_2.png": "c5dcf2c9c247f70a4ca81b9ad2e9442d",
"assets/assets/card_sprites/monsters/5_1.png": "78646ece972a38ac2d3b087d1e968e56",
"assets/assets/card_sprites/monsters/5_2.png": "5ee9b79ee189c23734a22de09b4e2154",
"assets/assets/card_sprites/monsters/6_1.png": "5a871cbe60ab28e6b340dc9c49db3557",
"assets/assets/card_sprites/monsters/6_2.png": "be56abee538acdcf9f6d7566c624c4c1",
"assets/assets/card_sprites/monsters/7_1.png": "b0124a110f495cd5c66cf97a4f74f5ea",
"assets/assets/card_sprites/monsters/7_2.png": "b5aa5da1511f92d0e04699d9189762e3",
"assets/assets/card_sprites/monsters/8_1.png": "9a159b82825181a89c455393124bba89",
"assets/assets/card_sprites/monsters/8_2.png": "288147913250355900b2e62e108c4ced",
"assets/assets/card_sprites/monsters/9_1.png": "da585de255b7b1f0cdcf48511f92ada4",
"assets/assets/card_sprites/monsters/9_2.png": "a8587fe0ae1c609ca74c21cbd6ba5f08",
"assets/assets/card_sprites/weapons/10.png": "c9d1c6a45c5fad974a13c1dffba31b52",
"assets/assets/card_sprites/weapons/2.png": "d2541f1b5e42bb8cbd74fab321df5140",
"assets/assets/card_sprites/weapons/3.png": "5fe77a40d2a2cdbfc0b0a99e19f0e49b",
"assets/assets/card_sprites/weapons/4.png": "60ca0c274c64dccc759961024a86e446",
"assets/assets/card_sprites/weapons/5.png": "3cd0e24851458d25426ef342c874c5d6",
"assets/assets/card_sprites/weapons/6.png": "6d844302b7d3ebad7729d0755d45974e",
"assets/assets/card_sprites/weapons/7.png": "7049a7da5115232f2844e3a3488a6b6e",
"assets/assets/card_sprites/weapons/8.png": "ebbc0312e8bf457712f20966e3810d83",
"assets/assets/card_sprites/weapons/9.png": "f1ee9da3a22555ec4c68dcef7e5f264b",
"assets/assets/fonts/ConcertOne-Regular.ttf": "47fb27f06685e983e830e0d7c33c5e8b",
"assets/assets/icons/app_icon.png": "f098a1df52aaafcfd911e3591d1d6219",
"assets/FontManifest.json": "5c9cae536d98fdc4a2c6b2f34f122166",
"assets/fonts/MaterialIcons-Regular.otf": "1a5ca7abbd990a346e544b4f174f99c0",
"assets/NOTICES": "6f1cbc3f5a6dc0d5eb88f387b6a559b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "11ff2102009674742fcccb8f67c57fa0",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "cf0d3bf827ccd2ae24bcf06b4099ea05",
"icons/Icon-192.png": "d40c607ed3e2a5b9395997c37e96e6b7",
"icons/Icon-512.png": "0784fe18e4e72b9cb1d3169ec9617882",
"icons/Icon-maskable-192.png": "d40c607ed3e2a5b9395997c37e96e6b7",
"icons/Icon-maskable-512.png": "0784fe18e4e72b9cb1d3169ec9617882",
"index.html": "cb838530abb994a02b62054384713743",
"/": "cb838530abb994a02b62054384713743",
"main.dart.js": "7ae286866c73b30fa743c23b53dbd799",
"manifest.json": "a762d337c7943942e87b26797a5e0ed0",
"version.json": "9ee1524e80f68850244867748af962ff"};
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
