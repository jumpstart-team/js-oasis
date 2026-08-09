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
});
