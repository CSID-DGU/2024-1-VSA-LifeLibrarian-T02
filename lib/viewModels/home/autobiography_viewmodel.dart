import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/home/autobiography_model.dart';
import '../../services/home/autobiography_service.dart';

class AutobiographyViewModel extends GetxController {
  final AutobiographyService service;

  AutobiographyViewModel(this.service);

  Rx<Autobiography?> autobiography = Rx<Autobiography?>(null);
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxBool isEditing = false.obs;
  TextEditingController contentController = TextEditingController();

  // 특정 자서전 상세 정보 조회
  Future<void> fetchAutobiography(int autobiographyId) async {
    try {
      isLoading(true);
      errorMessage('');

      // Todo: 실제 API 호출 부분
      // final result = await service.fetchAutobiography(autobiographyId);

      // 더미 데이터
      final result = Autobiography(
        id: autobiographyId,
        chapterId: 1,
        memberId: 1,
        title: 'Dummy Title',
        content: '나는 김도훈이다. 1985년 3월 15일, 대한민국 서울의 작은 동네에서 태어나 한평생을 꿈을 향해 달려왔다. 이 책은 나의 이야기이다. 꿈을 이루기 위한 여정에서 겪은 도전과 극복, 그리고 소중한 사람들과의 만남을 통해 나는 성장했다. 이 자서전이 당신에게도 용기와 영감을 주길 바란다.\n\n'
            '내가 자란 동네는 조용하고 평화로웠다. 부모님은 열심히 일하며 나와 두 명의 여동생을 키우셨다. 아버지는 성실한 공무원이었고, 어머니는 따뜻한 손길로 가정을 돌보는 주부였다. 부모님은 항상 우리에게 꿈을 가지고 도전하라고 가르쳐주셨다.\n'
            '어린 시절 나는 호기심이 많고 활발한 아이였다. 학교에서 수학과 과학에 큰 흥미를 느꼈고, 과학자가 되는 꿈을 꾸기 시작했다. 여동생들과의 시간도 소중했다. 우리는 함께 많은 시간을 보내며 서로의 꿈을 응원했다.',
        contentPreview: '내가 태어났을 때, 나의 가족은 ...',
        coverImageUrl: 'http://example.com/dummy.jpg',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      autobiography(result);
    } catch (e) {
      errorMessage(e.toString());
    } finally {
      isLoading(false);
    }
  }

  void toggleEditing() {
    isEditing.value = !isEditing.value;
  }
}
