// Radio Question Tick Action
var questions = document.querySelectorAll('.exam-question-radio');
questions.forEach((question) => {
    let answers = question.querySelectorAll('.answer-box');
    answers.forEach((answer) => {
        answer.addEventListener('click', () => {
            let arrayAnswers = Array.from(answers);
            console.log(arrayAnswers);
            tickedAnswers = arrayAnswers.filter((arrayAnswer) => {
                return arrayAnswer.classList.contains('answer-box--ticked');
            });
            console.log(tickedAnswers);
            if(answer.classList.contains('answer-box--ticked')) {
                answer.classList.remove('answer-box--ticked');
            }
            else {
                if(tickedAnswers.length < 1) {
                    answer.classList.add('answer-box--ticked');
                }
                else {
                    answer.classList.add('answer-box--ticked');
                    tickedAnswers.forEach((tickedAnswer) => {
                        tickedAnswer.classList.remove('answer-box--ticked');
                    });
                }
            }
        });
    });
});