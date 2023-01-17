import numpy as np

from video_background_estimation.EstimateBackground import BackgroundEstimation


class TestBackgroundEstimation:

    be_obj = BackgroundEstimation("videos/british_highway_traffic.mp4", frame_fraction=0.01)

    def test_num_frames(self):
        """
        test if video is read as expected
        """
        assert self.be_obj.num_frames > 0, "video file corrupt or not able to read"

    def test_get_background(self):
        """
        test get background functionalities
        """
        back_image = self.be_obj.get_background(method="mean")
        assert isinstance(back_image, np.ndarray)
        # check if RGB image is returned
        assert back_image.shape[2] == 3, "not returning rgb image"
