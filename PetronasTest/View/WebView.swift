//
//  WebView.swift
//  PetronasTest
//
//  Created by Fateh Khan on 15/04/2021.
//

import SafariServices
import SwiftUI

struct WebView: UIViewControllerRepresentable {

    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<WebView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<WebView>) {}
}
