//
//  StateObservable.swift
//  for ToDoList
//
//  Created by Iuliia Filimonova on 24.09.2024
//
    
import Foundation

@propertyWrapper
final class StateObservable<Value> {
    var projectedValue: StateObservable<Value> { self }
    
    var wrappedValue: Value {
        didSet {
            observations.clearOutdated()
            observations.update(with: wrappedValue)
        }
    }
    
    private let observations = Observations<Value>()
    
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
    
    @discardableResult
    func observe(_ observer: AnyObject, closure: @escaping ObservationClosure<Value>) -> CancellableObservation {
        let observation = Observation(observer: observer, closure: closure)
        observation.update(with: wrappedValue)
        observations.append(observation)
        
        return observation
    }
    
    func valueHasMutated() {
        observations.update(with: wrappedValue)
    }
}

