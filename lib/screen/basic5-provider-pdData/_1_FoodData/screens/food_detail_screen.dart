import 'package:flutter/material.dart';

import '../model/food_item.dart';
// FoodItem 모델이 있는 경로를 import 해주세요.
// import '../models/food_item.dart';

class FoodDetailScreen extends StatelessWidget {
  final FoodItem foodItem; // 전달받을 데이터

  const FoodDetailScreen({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.title ?? '상세 정보'), // 타이틀이 null일 경우 대비
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. 음식 이미지 (Hero 애니메이션 적용)
            if (foodItem.image != null && foodItem.image!.isNotEmpty)
              Hero(
                tag: 'food_image_${foodItem.title}', // 목록 화면과 동일한 태그 사용
                child: Image.network(
                  foodItem.image!,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const SizedBox(height: 300, child: Center(child: Icon(Icons.broken_image, size: 50))),
                ),
              ),

            // 2. 텍스트 정보 영역
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.mainTitle ?? '제목 없음',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    foodItem.title ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}