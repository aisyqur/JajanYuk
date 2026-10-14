/* JajanYuk — shared interaction layer (vanilla JS, no build step) */
(function () {
  "use strict";

  document.addEventListener("DOMContentLoaded", function () {
    initNavbarScroll();
    initScrollReveal();
    initStarPickers();
    initUploadPreview();
  });

  /* Glass navbar gains shadow/opacity once the page scrolls */
  function initNavbarScroll() {
    var nav = document.querySelector(".jy-navbar");
    if (!nav) return;
    function onScroll() {
      if (window.scrollY > 8) {
        nav.classList.add("jy-scrolled");
      } else {
        nav.classList.remove("jy-scrolled");
      }
    }
    window.addEventListener("scroll", onScroll, { passive: true });
    onScroll();
  }

  /* Fade elements in as they enter the viewport */
  function initScrollReveal() {
    var items = document.querySelectorAll(".jy-reveal-scroll");
    if (!items.length) return;

    if (!("IntersectionObserver" in window)) {
      items.forEach(function (el) { el.style.opacity = 1; });
      return;
    }

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add("jy-reveal");
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12 }
    );

    items.forEach(function (el) { observer.observe(el); });
  }

  /* Turn any <select class="jy-rating-select"> into a clickable star picker.
     Progressive enhancement: the native select stays functional as a fallback
     and is only visually hidden once the stars are wired up successfully. */
  function initStarPickers() {
    var selects = document.querySelectorAll("select.jy-rating-select");

    selects.forEach(function (select) {
      try {
        var wrapper = document.createElement("div");
        wrapper.className = "jy-star-picker";
        wrapper.setAttribute("role", "radiogroup");
        wrapper.setAttribute("aria-label", "Rating");

        var stars = [];
        for (var i = 1; i <= 5; i++) {
          var star = document.createElement("i");
          star.className = "bi bi-star";
          star.dataset.value = i;
          (function (val, starEl) {
            starEl.addEventListener("click", function () {
              setValue(val);
            });
            starEl.addEventListener("mouseenter", function () {
              paint(val);
            });
          })(i, star);
          stars.push(star);
          wrapper.appendChild(star);
        }

        wrapper.addEventListener("mouseleave", function () {
          paint(parseInt(select.value, 10) || 0);
        });

        function paint(val) {
          stars.forEach(function (s, idx) {
            var filled = idx < val;
            s.className = filled ? "bi bi-star-fill jy-star-active" : "bi bi-star";
          });
        }

        function setValue(val) {
          select.value = String(val);
          select.dispatchEvent(new Event("change", { bubbles: true }));
          paint(val);
        }

        select.insertAdjacentElement("afterend", wrapper);
        select.style.position = "absolute";
        select.style.opacity = "0";
        select.style.height = "0";
        select.style.padding = "0";
        select.style.border = "none";
        select.style.pointerEvents = "none";

        paint(parseInt(select.value, 10) || 0);
      } catch (err) {
        /* If anything goes wrong, leave the native select fully visible/usable */
        select.style.position = "";
        select.style.opacity = "";
        select.style.height = "";
      }
    });
  }

  /* Live image preview for file upload boxes */
  function initUploadPreview() {
    var input = document.getElementById("file");
    var box = document.getElementById("uploadBox");
    if (!input || !box) return;

    input.addEventListener("change", function () {
      var file = input.files && input.files[0];
      if (!file) return;
      var reader = new FileReader();
      reader.onload = function (e) {
        box.style.backgroundImage = "url(" + e.target.result + ")";
        box.classList.add("jy-has-preview");
      };
      reader.readAsDataURL(file);
    });
  }
})();
