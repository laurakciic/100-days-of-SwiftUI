//
//  Questions.swift
//  Challenge3_Kids_Multiplication_Game
//
//  Created by Laura on 09.09.2022..
//

import Foundation

struct Questions {
    var questions = [Question]()
    
    init(table: Int, numberOfQuestions: Int) {
        questions = generateQuestions(table: table, numberOfQuestions: numberOfQuestions)
    }
    
    func generateQuestions(table: Int, numberOfQuestions: Int) -> [Question] {
        var generatedQuestions = [Question]()
        
        for i in 1...table {
            for j in 1...12 {
                if j >= i {
                    let answer = String(i * j)
                    generatedQuestions.append(Question(text: "\(i) x \(j) = ", answer: answer))
                }
            }
        }
        
        generatedQuestions.shuffle()
        
        let questionsArray = Array(generatedQuestions[0..<numberOfQuestions])
        
        return questionsArray
    }
}
