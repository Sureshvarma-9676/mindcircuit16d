<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Catch the Target Game</title>
    <style>
        body {
            margin: 0;
            padding: 20px;
            background: linear-gradient(to bottom, #1a1a2e, #16213e);
            height: 100vh;
            overflow: hidden;
            font-family: Arial, sans-serif;
            color: #fff;
        }
        #game-area {
            width: 100%;
            height: 80vh;
            border: 2px solid #00ffcc;
            position: relative;
            background: rgba(0, 0, 0, 0.5);
            border-radius: 10px;
        }
        .target {
            position: absolute;
            width: 50px;
            height: 50px;
            background: radial-gradient(circle, #ff4d4d, #ff1a1a);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: transform 0.1s;
        }
        .target:hover {
            transform: scale(1.2);
            background: radial-gradient(circle, #ff6666, #ff3333);
        }
        #score {
            text-align: center;
            font-size: 24px;
            margin: 10px 0;
            color: #00ffcc;
        }
    </style>
</head>
<body>
    <div id="score">Score: 0</div>
    <div id="game-area"></div>

    <script>
        const gameArea = document.getElementById('game-area');
        const scoreDisplay = document.getElementById('score');
        let score = 0;

        function createTarget() {
            const target = document.createElement('div');
            target.className = 'target';
            target.style.left = Math.random() * (gameArea.offsetWidth - 50) + 'px';
            target.style.top = Math.random() * (gameArea.offsetHeight - 50) + 'px';

            target.addEventListener('click', () => {
                score += 10;
                scoreDisplay.textContent = `Score: ${score}`;
                target.remove();
                createTarget();
            });

            gameArea.appendChild(target);

            // Move target every 1 second
            setInterval(() => {
                target.style.left = Math.random() * (gameArea.offsetWidth - 50) + 'px';
                target.style.top = Math.random() * (gameArea.offsetHeight - 50) + 'px';
            }, 1000);
        }

        // Create initial target
        createTarget();
    </script>
</body>
</html>
