/***********************************************************/
function cache(request, response) {
    if (response.type === "error" || response.type === "opaque") {
      return Promise.resolve(); // do not put in cache network errors
    }
  
    return caches
      .open('v1')
      .then(cache => cache.put(request, response.clone()));
  }
/***********************************************************/
self.addEventListener("install", event => {
    event.waitUntil(
        caches.open('v1').then(function(cache) {
          return cache.addAll([
            '/',
            '/offres-de-stage',
            'https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js',
            '/users/profil',
            '/candidatures',
            '/wish-list',
            '/assets/js/main.js',
            '/assets/css/style.css'
          ]);
        })
    );
  });
  /************************************************/
  self.addEventListener("activate", event => {
    console.log("Service Worker activating.");
  });
/***********************************************/
self.addEventListener("fetch", event => {
    // Stratégie Cache-First
    event.respondWith(
      caches
        .match(event.request) // On vérifie si la requête a déjà été mise en cache
        .then(cached => cached || fetch(event.request)) // sinon on requête le réseau
        .then(
          response =>
            cache(event.request, response) // on met à jour le cache
              .then(() => response) // et on résout la promesse avec l'objet Response
        )
    );
  });
  const CACHE_NAME = "V2";

  self.addEventListener("activate", event => {
    // delete any unexpected caches
    event.waitUntil(
      caches
        .keys()
        .then(keys => keys.filter(key => key !== CACHE_NAME))
        .then(keys =>
          Promise.all(
            keys.map(key => {
              console.log(`Deleting cache ${key}`);
              return caches.delete(key);
            })
          )
        )
    );
  });