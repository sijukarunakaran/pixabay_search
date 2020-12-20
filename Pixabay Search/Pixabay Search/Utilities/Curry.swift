//
//  Curry.swift
//  Pixabay Search
//
//  Created by Siju Karunakaran on 20/12/20.
//

func curry <A, B, C> (_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in { b in f(a,b) } }
}


func curry <A, B, C, D> (_ f: @escaping (A, B, C) -> D) -> (A) -> (B) -> (C) -> D {
    return { a in { b in { c in f(a,b,c) } } }
}
