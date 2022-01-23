// Checkbox Question Tick Action
var questions = document.querySelectorAll('.exam-question-checkbox');
questions.forEach((question) => {
    let answers = question.querySelectorAll('.answer-box');
    answers.forEach((answer) => {
        answer.addEventListener('click', () => {
            if(answer.classList.contains('answer-box--ticked')){
                answer.classList.remove('answer-box--ticked');
            }
            else {
                answer.classList.add('answer-box--ticked');
            };
        });
    });
});