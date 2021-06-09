
import SwiftUI
import SVGKit


#if os(macOS)
@available(macOS 10.15, *)
struct SVGKFastImageViewSUI: NSViewRepresentable
{
    @Binding var url:URL
    @Binding var size:CGSize
    
    func makeNSView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        svgImage?.size = size
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
    }
    
    func updateNSView(_ nsView: SVGKFastImageView, context: Context) {
        nsView.image = SVGKImage(contentsOf: url)
        nsView.image.size = size
    }
    
    typealias NSViewType = SVGKFastImageView
    
}
#else
@available(iOS 13.0, *)
struct SVGKFastImageViewSUI:UIViewRepresentable
{
    @Binding var url:URL
    @Binding var size:CGSize
    func makeUIView(context: Context) -> SVGKFastImageView {
        let svgImage = SVGKImage(contentsOf: url)
        svgImage?.size = size
        return SVGKFastImageView(svgkImage: svgImage ?? SVGKImage())
        
    }
    func updateUIView(_ uiView: SVGKFastImageView, context: Context) {
        uiView.image = SVGKImage(contentsOf: url)
        uiView.image.size = size
    }
}
#endif
