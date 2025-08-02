const container = document.querySelector('.overlay');
const buttons = document.querySelectorAll('button');
let debugMode = false;

function debugPrint(msg) {
    if (debugMode) {
        console.log(`[Behr_ClothingCommands] ${msg}`);
    }
}

buttons.forEach(button => {
  button.addEventListener('click', () => {
    const action = button.getAttribute('data-slot');
    debugPrint(`Button clicked: ${action}`);
    fetch(`https://${GetParentResourceName()}/toggleClothing`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ slot: action })
    });
  });
});

window.addEventListener('message', (event) => {
    if (event.data.action === 'openUI') {
        debugPrint('Opening UI...');
        container.style.display = 'flex';

        if (event.data.debug) {
            debugMode = true;
            debugPrint('UI opened in debug mode.');
        }
    }
});

document.addEventListener('keyup', (event) => {
  if (event.key === 'Escape' || event.key === 'Backspace') {
    container.style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeUI`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({})
    });
  }
});

document.getElementById('closeBtn').addEventListener('click', () => {
  container.style.display = 'none';
  fetch(`https://${GetParentResourceName()}/closeUI`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({})
  });
});
