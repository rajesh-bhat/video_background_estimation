from video_background_estimation.EstimateBackground import BackgroundEstimation
import cv2

def save_image(frame, file_name):
    cv2.imwrite(file_name, frame)
    
if __name__ == "__main__":

    back_est = BackgroundEstimation("videos/british_highway_traffic.mp4", frame_fraction=0.01)
    result = back_est.get_background(method="mean")
    save_image(result, "results/background.jpg")

