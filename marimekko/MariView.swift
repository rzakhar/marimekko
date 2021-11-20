//
//  MariView.swift
//  marimekko
//
//  Created by Roman Zakharov on 19.11.2021.
//

import ARKit
import SwiftUI
import RealityKit

struct MariView: View {
    var body: some View {
        ARKitView()
    }
}

struct MariView_Previews: PreviewProvider {
    static var previews: some View {
        MariView()
    }
}

//Displays as a SwiftUI View
struct ARKitView : View {
    var body: some View {
        return ARViewContainer()
    }
}

struct ARViewContainer: UIViewRepresentable {
    var arView = ARView(frame: .zero)

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, ARSessionDelegate{
        var parent: ARViewContainer
        var videoPlayer: AVPlayer!

        init(parent: ARViewContainer) {
            self.parent = parent
        }

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
                print("Unable to load an anchor.")
                return
            }

            if let imageName = imageAnchor.name, imageName == "kukat" {
                guard let videoURL = Bundle.main.url(forResource: imageName, withExtension: "mp4") else {
                    print("Unable to find a video file.")
                    return
                }

                let playerItem = AVPlayerItem(url: videoURL)
                videoPlayer = AVPlayer(playerItem: playerItem)
                let videoMaterial = VideoMaterial(avPlayer: videoPlayer)

                let width: Float = Float(imageAnchor.referenceImage.physicalSize.width)
                let height: Float = 9 / 16 * width


                let videoPlane = ModelEntity(mesh: .generatePlane(width: width, depth: height, cornerRadius: 0.01),
                                             materials: [videoMaterial])

                let anchor = AnchorEntity(anchor: imageAnchor)
                anchor.addChild(videoPlane)
                parent.arView.scene.addAnchor(anchor)
            }
        }

        func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
            guard let imageAnchor = anchors[0] as? ARImageAnchor else {
                print("Unable to load an anchor.")
                return
            }

            if imageAnchor.isTracked {
                videoPlayer.play()
            } else {
                videoPlayer.pause()
            }
        }
    }

    func makeUIView(context: Context) -> ARView {
        guard let referenceImages = ARReferenceImage.referenceImages(
                    inGroupNamed: "AR Resources", bundle: nil) else {
                    fatalError("Unable to load AR Resources.")
                }

        arView.session.delegate = context.coordinator

        let configuration = ARImageTrackingConfiguration()
        configuration.isAutoFocusEnabled = true
        configuration.trackingImages = referenceImages
        configuration.maximumNumberOfTrackedImages = 1

        if ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) {
            configuration.frameSemantics.insert(.personSegmentationWithDepth)
        }

        arView.session.run(configuration)
        return arView
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}
