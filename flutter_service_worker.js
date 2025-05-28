'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "ca861afc6adbe54b31288da5a4163db4",
".git/config": "81020b082f49a36732cb6c5c0f046fdc",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "29b95ad4911b7565103e71f5ae94ccb0",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "c2e976fd79f96a2fdac272e528809ab5",
".git/logs/refs/heads/gh-pages": "b4607fee3818040429f48de845b11e98",
".git/logs/refs/remotes/origin/gh-pages": "9dd71777a74e27d236b880092b2eb64b",
".git/objects/02/d379985de129bf1118143f9405993014d84a88": "49a3fd720a605cdff3cce75df2a0f8a8",
".git/objects/04/f98da1cdf4d40e1dc12ec8bad6091e0172ff7b": "4942a58877fd09c4ae564220ff57099e",
".git/objects/05/a9058f513cce5faf1704e06e3c150688b0a01f": "e8d02f60cf87abd4c1de4b153dd696dc",
".git/objects/24/7402a24444dfedac64adba1cf9f979d0f6eeb4": "bdf993e60680bc0c0c0b0bdef8a83d35",
".git/objects/27/394762dc5c45d68afbb60002587c547245814b": "bd65ce9eacd420c3c586b3358cfc9cd3",
".git/objects/27/a297abdda86a3cbc2d04f0036af1e62ae008c7": "51d74211c02d96c368704b99da4022d5",
".git/objects/2d/76ecf7d0750ae34e1feb120f96a96c79e0505d": "d936dd28ca0c69e0b67d99fbaf49b95d",
".git/objects/2f/57c0dc8c3553df5551ef0c398cc8d99715f803": "0a16d4affae26314d7a81745d1663ae4",
".git/objects/2f/cdc6360153fa63c332127a98d8690e75553c44": "5f60d6208756e7f4dfb8e6947cd55982",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4c/98582f791155e461f4633183552087d46f810b": "869983ceb7371aa834e7fd9208a21f42",
".git/objects/54/3b024bd9c48a286a2b0395cb7d8271afd37e1b": "88f6b34385ab4acad90393512abae86c",
".git/objects/55/39c7ef1179c5a0a2aa076413969548c0e90bc0": "be0f8773f538d4c8223b68876f7d3a22",
".git/objects/5f/b52d0f193f10aa3c887fc5cd6d81390353926c": "067ec3cde320090c76f46d69eb676ef7",
".git/objects/63/6931bcaa0ab4c3ff63c22d54be8c048340177b": "8cc9c6021cbd64a862e0e47758619fb7",
".git/objects/68/4fe94175f192a60b29695f0e454f91cb0ac718": "d992c8fe4416fee75d185fa87afa698e",
".git/objects/6d/5f0fdc7ccbdf7d01fc607eb818f81a0165627e": "2b2403c52cb620129b4bbc62f12abd57",
".git/objects/6f/ef68943eaba8c1849ca5a79a90a7ab8c9ec70c": "885f74f19ab5e68abb830a317dc2995a",
".git/objects/70/e816c366668dd69e38bd08718fc4e64efe5781": "11748fb13d51db5c61b63b91468ba699",
".git/objects/72/7b5d67db3537177352ba69f1d3092adfb77150": "1b44fda01f31eefffd1ff6043c198592",
".git/objects/73/7f149c855c9ccd61a5e24ce64783eaf921c709": "1d813736c393435d016c1bfc46a6a3a6",
".git/objects/76/245dbf30e799d9e1a633c47a34e91b57949455": "10a9189d22f7ff482f9d4d5d8f04f7d5",
".git/objects/80/ef19f5b40fd647548c4808551795fd390aad3c": "5e25a2227bd75e3e794bde57936c9b4d",
".git/objects/82/38ff7d2d6f5b0659326d9b16f6516abcb906bd": "406818a7a6d76c7537d367875051c1e9",
".git/objects/86/55a5bac96a93f9ba7d6304586f9f87947ee173": "0528901a8408aa76677042ec37534256",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8c/59773bee8314a8ffb4431593d0fb49f52e34c6": "2eb993d30677573ffd0e58484cc6a514",
".git/objects/8e/2ac2a2e20971dfb5fba4c36ba6f68d69266c91": "e212d9c3218b213d7449e919a065ed38",
".git/objects/94/420d0648b37ad2759c55c26ba265849dc68cb4": "ccb6e4d7f35d4e35bd5b0febb4d7f341",
".git/objects/94/ef43cd7367de877fe9ef2f087c6d7a2539112b": "c418b92894f02862abae21ef6b1603ca",
".git/objects/96/e99bb17c121e7ce946716971ef5773ca3b65c2": "6afa39abc13d98954397a8425554481f",
".git/objects/97/8a4d89de1d1e20408919ec3f54f9bba275d66f": "dbaa9c6711faa6123b43ef2573bc1457",
".git/objects/ab/9e0265f7102997b94f8179a64a0b402e5c324d": "2458bfbe442792dde4b02b060efcc193",
".git/objects/ae/73c6a951109a65954bf201c51311882fe625d1": "22f4ee5fd61143f9f71d0a204ca7f10a",
".git/objects/af/31ef4d98c006d9ada76f407195ad20570cc8e1": "a9d4d1360c77d67b4bb052383a3bdfd9",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/afd5429fbe3cc7a88b89f454006eb7b018849a": "e4c2e016668208ba57348269fcb46d7b",
".git/objects/b7/3f1308ea5bd38f08a566fd8501a5e089fb3162": "8d4d25807f81d7a348303821d700ffc9",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/916bcd5dbb637a4188f9f2f51b57c41292a843": "d685e3698b6589a90d2dc958bbdbd7e7",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c3/e81f822689e3b8c05262eec63e4769e0dea74c": "8c6432dca0ea3fdc0d215dcc05d00a66",
".git/objects/c6/06caa16378473a4bb9e8807b6f43e69acf30ad": "ed187e1b169337b5fbbce611844136c6",
".git/objects/c7/7ef314b497b5c95a8d48e9283ed3746b1b8392": "a002625af5622247ddbcb36f99864ca0",
".git/objects/cc/30379f5a291bc93efdcb6c09c41a099c0922c9": "0fcc81176c8ef6f3d9ed864487c86e65",
".git/objects/d2/10f948712b1d3911ad67cf7d1059aee4097105": "675d807938a2357875b55fd8e1f4b166",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/45e0a790b4f76dd78f08a2f215526cea6f87e1": "cc24cb36503e36ac5e0fa48a44ae9aa7",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/e1/2f065c75ad0b95299394de019498412724826e": "80374cf65a39948e98387e09b1103153",
".git/objects/e1/ec875b0f97ce612b3317b81ca18660d2a675c7": "17f7b7f39adbcd29b217fcdcb4862330",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ec/361605e9e785c47c62dd46a67f9c352731226b": "d1eafaea77b21719d7c450bcf18236d6",
".git/objects/ec/7da868ad21bbf0c2bb3d6994dbd28ddb513c7f": "0ab221bf0643c9a39bf72398f00e8527",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f4/55de04739f9592863f4ed9a6a0ea5608794a94": "77dd4f0c4e4428ff7e20dd391fceed7e",
".git/objects/f5/1ed97e9713d3374f26b6e8647b6bdbbdcfc3e8": "d297a579dc5cc86732e22cfdb2c1b0c2",
".git/refs/heads/gh-pages": "60dfcc05bf97e3e741734d49ebfa1406",
".git/refs/remotes/origin/gh-pages": "ab93b442ab782ffed024d0e896f72922",
"assets/AssetManifest.bin": "da8bb8f4dfcd390b39e30d5c4ab3ef82",
"assets/AssetManifest.bin.json": "7e2e11e94e1e094b41c492c73cd51527",
"assets/AssetManifest.json": "699a67b35cd6c8d0391206eebd4da6b0",
"assets/assets/AssetManifest.bin": "a5322473e79f41bcdcbb7fc910e7a291",
"assets/assets/AssetManifest.bin.json": "18d7db292601d3bba0c9759327334b1b",
"assets/assets/AssetManifest.json": "c7b4be6bac34c56540b6ab2f4f659035",
"assets/assets/bgimages/hero_bg.jpeg": "a7701b5e9d07fb16892c6fc470af7771",
"assets/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/food.jpg": "afd6cd7394852dd7b9e079aec4a4ac9e",
"assets/assets/logo/logo.jpeg": "17b5ebdc36f2264286112b3645bb68ce",
"assets/assets/logo/logo_v1.jpeg": "b0c6306ae12d154ca36c4f33e4d3be27",
"assets/assets/NOTICES": "608e753784eca59b88fd8c7a71c0fed1",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d92f8e77a713d1e50bf12d807264318b",
"assets/NOTICES": "f54f5dd484437dd93d412a0233058b46",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6aafb6d6ab2fa640b6998f6b72583349",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "d79b9da4afe1cbad8e6e418df2c01c21",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "be4ea4c6d61e98941648983fb5f086cf",
"/": "be4ea4c6d61e98941648983fb5f086cf",
"main.dart.js": "da14bc864e71a9d25126b0925e3edfcc",
"manifest.json": "a331b1c02d04212c6e61b0ae494a1ccf",
"version.json": "171884f27d638c1ab2a427f69473aa43"};
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
