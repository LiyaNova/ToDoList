//
//  Observation.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import Foundation

typealias ObservationClosure<Value> = (Value) -> Void

protocol CancellableObservation {
    func cancel()
}

final class Observation<Value>: CancellableObservation {
    private(set) weak var observer: AnyObject?
    private(set) var isCancelled = false
    
    private let closure: ObservationClosure<Value>
    
    init(observer: AnyObject, closure: @escaping ObservationClosure<Value>) {
        self.observer = observer
        self.closure = closure
    }
    
    func update(with value: Value) {
        closure(value)
    }
    
    func cancel() {
        isCancelled = true
    }
}

final class Observations<Value> {
    private var observations = [Observation<Value>]()
    
    func append(_ observation: Observation<Value>) {
        observations.append(observation)
    }
    
    func clearOutdated() {
        observations.removeAll { $0.observer == nil || $0.isCancelled }
    }
    
    func update(with value: Value) {
        observations.forEach { $0.update(with: value) }
    }
}
