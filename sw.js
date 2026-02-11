// Temporary cleanup service worker (temporary - remove after deployment)
// Purpose: Remove any existing caches created by previous PWA service workers,
// unregister itself, and cause client pages to reload so they fetch fresh content.
// This file should be deployed at the site root (./sw.js) and removed once
// most clients have been updated.

self.addEventListener('install', (event) => {
  // Activate immediately so 'activate' runs without waiting for page reloads
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil((async () => {
    try {
      // Delete all caches (clears older site assets cached by prior SWs)
      const keys = await caches.keys();
      await Promise.all(keys.map((k) => caches.delete(k)));
      console.log('All caches cleared by cleanup SW:', keys);

      // Unregister this service worker so it does not persist
      await self.registration.unregister();
      console.log('Cleanup SW unregistered itself');

      // Attempt to reload all open window clients so they fetch fresh resources
      const allClients = await clients.matchAll({ type: 'window', includeUncontrolled: true });
      for (const client of allClients) {
        try {
          // Try a navigation reload — some browsers support this
          await client.navigate(client.url);
        } catch (e) {
          // Fallback: postMessage to the client to let page reload itself if it listens
          try { client.postMessage({ action: 'cleanup-reload' }); } catch (err) {}
        }
      }
    } catch (err) {
      console.error('Cleanup SW encountered an error:', err);
    }
  })());
});
