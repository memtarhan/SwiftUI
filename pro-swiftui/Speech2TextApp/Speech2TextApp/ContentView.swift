//
//  ContentView.swift
//  Speech2TextApp
//
//  Created by Mehmet Tarhan on 28/11/2022.
//

import Speech
import SwiftUI

struct ContentView: View {
    private let audioEngine = AVAudioEngine()
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    @State private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    @State private var recognitionTask: SFSpeechRecognitionTask?

    @State var message = ""
    @State var buttonStatus = true

    var body: some View {
        VStack {
            TextEditor(text: $message)
                .frame(width: 350, height: 400)
            Button(buttonStatus ? "Start recording" : "Stop recording", action: {
                buttonStatus.toggle()
                if buttonStatus {
                    stopRecording()
                } else {
                    startRecording()
                }
            })
            .padding()
            .background(buttonStatus ? Color.green : Color.red)
        }
        .padding()
    }

    func stopRecording() {
        audioEngine.stop()
        recognitionTask?.cancel()
        audioEngine.inputNode.removeTap(onBus: 0)
        recognitionRequest?.endAudio()
    }

    func startRecording() {
        message = "Start recording"
        let node = audioEngine.inputNode
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        recognitionRequest?.shouldReportPartialResults = true
        let recordingFormat = node.outputFormat(forBus: 0)
        node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            recognitionRequest?.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            return print(error)
        }
        guard let recognizeMe = SFSpeechRecognizer() else {
            return
        }
        if !recognizeMe.isAvailable {
            return
        }
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest ?? SFSpeechAudioBufferRecognitionRequest(), resultHandler: { result, error in
            if let result = result {
                let transcribedString = result.bestTranscription.formattedString
                message = transcribedString
            } else if let error = error {
                print(error)
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
