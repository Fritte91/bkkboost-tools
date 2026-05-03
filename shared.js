// BkkBoost Tools — shared client JS
// Currently: theme toggle handler. The early-paint theme set is inlined
// in each page's <head> to avoid a flash of the wrong theme.

(function () {
  'use strict';

  const STORAGE_KEY = 'bkk-theme';

  function setTheme(theme) {
    if (theme === 'light') {
      document.documentElement.setAttribute('data-theme', 'light');
    } else {
      document.documentElement.removeAttribute('data-theme');
    }
    try { localStorage.setItem(STORAGE_KEY, theme); } catch (e) {}
  }

  function currentTheme() {
    return document.documentElement.getAttribute('data-theme') === 'light' ? 'light' : 'dark';
  }

  function bindToggle() {
    document.querySelectorAll('.theme-toggle').forEach(btn => {
      if (btn.dataset.bound) return;
      btn.dataset.bound = '1';
      btn.addEventListener('click', () => {
        setTheme(currentTheme() === 'light' ? 'dark' : 'light');
      });
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', bindToggle);
  } else {
    bindToggle();
  }
})();
