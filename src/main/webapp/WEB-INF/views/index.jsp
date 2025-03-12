<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>필라테스 도우미 - 개인 맞춤형 필라테스 조언</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="<%= request.getContextPath() %>/assets/style.css" rel="stylesheet">
</head>
<body>
<!-- Main App Container -->
<div class="container app-container">
    <!-- Intro Card -->
    <div class="card intro-card text-center mb-4">
        <h1 class="display-5 fw-bold mb-3">필라테스 AI 도우미</h1>
        <p class="lead">개인 맞춤형 필라테스 조언을 받아보세요</p>

        <!-- Pilates SVG Icon -->
        <div class="text-center">
            <img id="main-image" src="<%= request.getContextPath() %>/images/main.webp">
        </div>

        <div class="rotating-text mt-3">
            <h5 id="rotatingText">건강한 몸과 마음을 위한 필라테스</h5>
        </div>
    </div>

    <!-- Question Form -->
    <div class="card question-form-card mb-4">
        <h3 class="mb-4 text-center">궁금한 점을 물어보세요</h3>
        <% if (session.getAttribute("message") != null) { %>
        <p><%= session.getAttribute("message") %></p>
        <% } %>
        <form id="questionForm" method="post">
            <div class="mb-3">
                <input type="text" name="question" class="form-control" id="questionInput" placeholder="예: 허리 통증에 좋은 필라테스 동작은 무엇인가요?" required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-gradient">질문하기</button>
            </div>
        </form>
    </div>

    <!-- Features Section -->
    <div class="features-section">
        <div class="feature-item text-center">
            <!-- 아이콘 사용 -->
            <div class="feature-icon">
                <i class="bi bi-arrow-up-circle-fill" style="font-size: 40px;"></i>
            </div>
            <h5>맞춤형 루틴</h5>
            <p>당신의 목표와 수준에 맞는 개인 맞춤형 필라테스 루틴</p>
        </div>

        <div class="feature-item text-center">
            <div class="feature-icon">
                <i class="bi bi-people-fill" style="font-size: 40px;"></i>
            </div>
            <h5>전문가 조언</h5>
            <p>필라테스 전문가들의 지식을 기반으로 한 조언</p>
        </div>

        <div class="feature-item text-center">
            <div class="feature-icon">
                <i class="bi bi-bullseye" style="font-size: 40px;"></i>
            </div>
            <h5>정확한 기술</h5>
            <p>필라테스 동작을 정확하게 수행하는 방법 안내</p>
        </div>
    </div>
</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

<script>
    // Sample rotating texts
    const rotatingTexts = [
        "건강한 몸과 마음을 위한 필라테스",
        "자세 교정과 코어 강화에 집중하세요",
        "필라테스로 더 유연하고 강한 몸을 만들어보세요",
        "맞춤형 필라테스 조언을 받아보세요"
    ];

    let currentTextIndex = 0;
    const rotatingTextElement = document.getElementById('rotatingText');

    // Rotate texts every 4 seconds
    setInterval(() => {
        currentTextIndex = (currentTextIndex + 1) % rotatingTexts.length;
        rotatingTextElement.style.opacity = 0;

        setTimeout(() => {
            rotatingTextElement.textContent = rotatingTexts[currentTextIndex];
            rotatingTextElement.style.opacity = 1;
        }, 500);
    }, 4000);

    // Sample responses for demo
    const sampleResponses = [
        "허리 통증 완화를 위한 필라테스 동작으로는 고양이-소 자세(Cat-Cow Stretch), 골반 틸트(Pelvic Tilt), 브릿지(Bridge)가 효과적입니다. 이러한 동작들은 척추의 유연성을 높이고 코어 근육을 강화하여 허리 통증을 완화하는 데 도움을 줍니다. 하루에 10-15분씩 꾸준히 실천해 보세요.",
        "임산부를 위한 필라테스 루틴은 골반 강화와 자세 유지에 초점을 맞춰야 합니다. 사이드 레그 리프트, 수정된 형태의 플랭크, 심호흡과 함께하는 골반저근 운동이 효과적입니다. 항상 의사와 상담 후 시작하시고, 불편함이 있으면 즉시 중단하세요.",
        "필라테스를 처음 시작하시는 분들에게는 기본적인 호흡법과 코어 활성화부터 배우는 것이 중요합니다. '백그라운드 브리딩'과 '임프린트'같은 기초 동작으로 시작하여 점진적으로 난이도를 높여가는 것이 좋습니다. 주 2-3회, 30분씩 연습하면서 몸의 변화를 느껴보세요.",
        "목과 어깨 긴장 완화를 위한 필라테스 동작으로는 넥 롤(Neck Roll), 숄더 브릿지(Shoulder Bridge), 체스트 오프너(Chest Opener)가 효과적입니다. 이 동작들은 상체의 긴장을 풀고 혈액 순환을 개선하는 데 도움이 됩니다. 특히 컴퓨터 작업을 많이 하시는 분들에게 추천합니다."
    ];

    // Typing effect function
    function typeWriter(element, text, i, speed) {
        if (i < text.length) {
            element.innerHTML = text.substring(0, i + 1) + '<span class="cursor">|</span>';

            setTimeout(() => {
                typeWriter(element, text, i + 1, speed);
            }, speed);
        } else {
            element.innerHTML = text;
            element.classList.add('animate-fadeInUp');
        }
    }
</script>
</body>
</html>