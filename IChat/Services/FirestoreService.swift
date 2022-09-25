//
//  FirestoreService.swift
//  IChat
//
//  Created by Яна Балковская on 19.09.22.
//

import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    func getUserData(user: User, completion: @escaping (Result<MUser, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let muser = MUser(document: document) else {
                    completion(.failure(UserError.canNotUnwrapToMUser))
                    return
                }
                completion(.success(muser))
            } else {
                completion(.failure(UserError.canNotGetUserInfo))
            }
        }
    }
    
    func saveProfileWith(id: String, email: String, username: String?, avatarImageString: String?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
//        guard avatarImage != #imageLiteral(resourceName: "avatar") else {
//            completion(.failure(UserError.photoNotExist))
//            return
//        }
        
        var muser = MUser(username: username!,
                          email: email,
                          avatarStringURL: "not exist",
                          description: description!,
                          sex: sex!,
                          id: id)
        self.usersRef.document(muser.id).setData(muser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
//        StorageService.shared.upload(photo: avatarImage!) { (result) in
//            switch result {
//
//            case .success(let url):
//                muser.avatarStringURL = url.absoluteString
//                self.usersRef.document(muser.id).setData(muser.representation) { (error) in
//                    if let error = error {
//                        completion(.failure(error))
//                    } else {
//                        completion(.success(muser))
//                    }
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
    }
}
