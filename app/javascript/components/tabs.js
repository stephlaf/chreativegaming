const showTabContent = () => {
  const tabs = document.querySelectorAll('.tabs p');
  if (tabs) {
    tabs.forEach((tab) => {
      tab.addEventListener('click', (event) => {
        const tabsContainer = tab.parentElement.parentElement;
        const tabNumber = tab.dataset.forTab;
        const contentActive = tabsContainer.querySelector(`.content[data-tab="${tabNumber}"]`);

        tabs.forEach((tab) => {
          tab.classList.remove("tab-active");
        });

        tabsContainer.querySelectorAll('.content').forEach((section) => {
          section.classList.remove("content-active");
        });

        tab.classList.add("tab-active");
        contentActive.classList.add("content-active");
      });
    });
  }
};

export { showTabContent };
