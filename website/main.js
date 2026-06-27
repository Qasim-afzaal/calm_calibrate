(() => {
  const nav = document.querySelector(".nav-bar");
  const toggle = document.querySelector(".nav-toggle");
  const links = document.querySelector(".nav-links");

  toggle?.addEventListener("click", () => {
    const open = links.classList.toggle("open");
    toggle.setAttribute("aria-expanded", String(open));
  });

  links?.querySelectorAll("a").forEach((a) => {
    a.addEventListener("click", () => links.classList.remove("open"));
  });

  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((e) => {
        if (e.isIntersecting) e.target.classList.add("visible");
      });
    },
    { threshold: 0.12, rootMargin: "0px 0px -40px 0px" }
  );

  document.querySelectorAll(".reveal").forEach((el) => observer.observe(el));

  document.querySelectorAll(".showcase-tabs").forEach((wrap) => {
    const tabs = wrap.querySelectorAll("[data-tab]");
    const panels = wrap.querySelectorAll("[data-panel]");
    tabs.forEach((tab) => {
      tab.addEventListener("click", () => {
        const id = tab.dataset.tab;
        tabs.forEach((t) => t.classList.toggle("active", t === tab));
        panels.forEach((p) => p.classList.toggle("active", p.dataset.panel === id));
      });
    });
  });
})();
