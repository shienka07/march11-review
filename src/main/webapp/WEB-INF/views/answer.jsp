<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>필라테스 도우미 - 답변</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- 메인 CSS -->
    <link href="<%= request.getContextPath() %>/assets/style.css" rel="stylesheet">
    <!-- 결과 페이지 추가 CSS -->
    <link href="<%= request.getContextPath() %>/assets/answer_style.css" rel="stylesheet">
</head>
<body>
<!-- Main App Container -->
<div class="container app-container">
    <!-- Intro Card -->
    <div class="card intro-card text-center mb-4">
        <h1 class="display-5 fw-bold mb-3">필라테스 AI 도우미</h1>
        <p class="lead">필라테스 관련 질문의 답변입니다</p>
    </div>

    <!-- Answer Card -->
    <div class="card question-form-card">
        <% if (session.getAttribute("answer") != null) { %>
        <div class="result-item">
                <span class="result-label">
                    <i class="bi bi-question-circle-fill me-2"></i>질문:
                </span>
            <p class="lead question-text"><%= session.getAttribute("question")%></p>
        </div>

        <div class="result-item">
                <span class="result-label">
                    <i class="bi bi-chat-square-text-fill me-2"></i>답변:
                </span>
            <p class="lead answer-text"><%= session.getAttribute("answer")%></p>
        </div>

        <div class="result-item">
            <details>
                <summary class="thinking-summary">
                    <i class="bi bi-lightbulb me-2"></i>생각 과정
                </summary>
                <div class="thinking-block">
                    <p><%= session.getAttribute("thinking")%></p>
                </div>
            </details>
        </div>

        <div class="result-item">
                <span class="result-label">
                    <i class="bi bi-diagram-3 me-2"></i>추론:
                </span>
            <div class="reasoning-block">
                <p><%= session.getAttribute("reasoning")%></p>
            </div>
        </div>

        <% if (session.getAttribute("image") != null) { %>
        <div class="text-center">
            <img class="result-image img-fluid"
                 alt="<%= session.getAttribute("answer")%>"
                 src="<%= session.getAttribute("image")%>">
        </div>
        <% } %>

        <div class="action-buttons">
            <a href="<%= request.getContextPath() %>/" class="btn btn-gradient me-2">
                <i class="bi bi-arrow-left me-2"></i>새 질문하기
            </a>
            <button class="btn btn-share" onclick="copyToClipboard()">
                <i class="bi bi-share me-2"></i>주소 복사하기
            </button>
            <span id="copySuccess" class="copy-success">복사되었습니다!</span>
        </div>
        <% } else { %>
        <div class="alert alert-warning">
            <i class="bi bi-exclamation-triangle-fill me-2"></i>
            표시할 결과가 없습니다.
        </div>
        <div class="text-center mt-4">
            <a href="<%= request.getContextPath() %>/" class="btn btn-gradient">
                <i class="bi bi-arrow-left me-2"></i>메인 페이지로 돌아가기
            </a>
        </div>
        <% } %>
    </div>

    <!-- Features Section -->
    <div class="features-section">
        <div class="feature-item text-center">
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

<!-- Copy URL Script -->
<script>
    function copyToClipboard() {
        // Create a temporary input element
        const tempInput = document.createElement("input");
        // Set its value to the current URL
        tempInput.value = window.location.href;
        // Append it to the body
        document.body.appendChild(tempInput);
        // Select all the text
        tempInput.select();
        // Copy the text
        document.execCommand("copy");
        // Remove the temporary element
        document.body.removeChild(tempInput);

        // Show success message
        const successMsg = document.getElementById("copySuccess");
        successMsg.style.display = "inline";

        // Hide success message after 3 seconds
        setTimeout(function() {
            successMsg.style.display = "none";
        }, 3000);
    }
</script>
</body>
</html>