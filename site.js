document.addEventListener('DOMContentLoaded', function () {
  // Mobile nav
  var toggle = document.querySelector('[data-mobile-toggle]');
  var menu = document.querySelector('[data-mobile-menu]');

  function closeMobileMenu() {
    if (menu) menu.classList.remove('is-open');
    if (toggle) {
      toggle.classList.remove('is-open');
      toggle.setAttribute('aria-expanded', 'false');
    }
  }

  if (toggle && menu) {
    toggle.addEventListener('click', function () {
      var isOpen = menu.classList.toggle('is-open');
      toggle.classList.toggle('is-open', isOpen);
      toggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });

    menu.querySelectorAll('a').forEach(function (link) {
      link.addEventListener('click', closeMobileMenu);
    });

    var desktopQuery = window.matchMedia('(min-width: 64rem)');
    desktopQuery.addEventListener('change', function (e) {
      if (e.matches) closeMobileMenu();
    });
  }

  // FAQ accordion
  document.querySelectorAll('[data-faq-item]').forEach(function (item) {
    var question = item.querySelector('[data-faq-question]');
    var answer = item.querySelector('[data-faq-answer]');
    if (!question || !answer) return;
    question.addEventListener('click', function () {
      var isOpen = question.classList.toggle('is-open');
      answer.classList.toggle('is-open', isOpen);
      question.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });
  });

  // Scroll reveal.
  //
  // The resting state in CSS is fully VISIBLE. The hidden state is only armed
  // here, immediately before observing, so if this script never runs (or the
  // browser lacks IntersectionObserver) nothing on the page is ever hidden.
  // An earlier version of this site defaulted to opacity:0 in raw CSS and made
  // most of the page permanently invisible when JS failed. Do not reintroduce
  // that: never move .reveal-armed into the stylesheet's default state.
  //
  // IntersectionObserver, not a scroll listener: a scroll handler fires on
  // every tick and forces continuous layout recalculation.
  var targets = document.querySelectorAll('[data-reveal]');
  if (targets.length && 'IntersectionObserver' in window) {
    targets.forEach(function (el) { el.classList.add('reveal-armed'); });
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.12, rootMargin: '0px 0px -60px 0px' });
    targets.forEach(function (el) { io.observe(el); });
  }
});
