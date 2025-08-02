const container = document.querySelector('.container');
const buttons = document.querySelectorAll('button');
let debugMode = false;

buttons.forEach(button => {
    button.addEventListener('click', () => {
        const action = button.textContent.trim();
        debugPrint(`Button clicked: ${action}`);
    });
});

function debugPrint(msg) {
    if (debugMode) {
        console.log(`[Behr_ClothingCommands] ${msg}`);
    }
}

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
    if (event.key === 'Escape') {
        debugPrint('Closing UI...');
        container.style.display = 'none';
        fetch(`https://${GetParentResourceName()}/closeUI`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({}),
        });
    }
    if (event.key === 'Backspace') {
        debugPrint('Closing UI...');
        container.style.display = 'none';
        fetch(`https://${GetParentResourceName()}/closeUI`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({}),
        });
    }
});

document.querySelectorAll(".clothing-button").forEach(button => {
    button.addEventListener("click", () => {
        const slot = button.dataset.slot;
        fetch(`https://${GetParentResourceName()}/toggleClothing`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ slot })
        });
    });
});

