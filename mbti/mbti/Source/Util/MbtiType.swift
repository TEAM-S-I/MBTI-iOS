//
//  Constant.swift
//  mbti
//
//  Created by dgsw8th71 on 12/18/23.
//

import SwiftUI

enum MbtiType: String, CaseIterable {
    case istp = "ISTP"
    case istj = "ISTJ"
    case isfp = "ISFP"
    case isfj = "ISFJ"
    case intp = "INTP"
    case intj = "INTJ"
    case infp = "INFP"
    case infj = "INFJ"
    case estp = "ESTP"
    case estj = "ESTJ"
    case esfp = "ESFP"
    case esfj = "ESFJ"
    case entp = "ENTP"
    case entj = "ENTJ"
    case enfp = "ENFP"
    case enfj = "ENFJ"
    
    var nameCircleType: NameCircleType {
        get {
            let mid = self.rawValue[1...2]
            switch mid {
            case "ST":
                return .salmon
            case "SF":
                return .yellow
            case "NT":
                return .blue
            case "NF":
                return .green
            default:
                return .blue
            }
        }
    }
    
    static func getType(_ str: String) -> MbtiType? {
        let mbtiTypes = MbtiType.allCases.filter { i in
            i.rawValue == str
        }
        
        if mbtiTypes.count == 0 {
            return nil
        }
        
        return mbtiTypes[0]
    }
    
    var pacDTO: PacDTO {
        get {
            var pacMembers: [PacMemberDTO]? = nil
            switch self {
                
            case .istp:
                pacMembers = [
                    PacMemberDTO(name: "ESTP", mbti: "활동가", strengths: "ISTP와 ESTP는 서로 유사한 성향을 가지고 있어 잘 맞는 유형입니다. 둘 모두 적응력이 뛰어나고 현실적인 문제 해결에 능숙하며, 두뇌와 손을 능숙하게 활용하는 경향이 있습니다. ISTP는 ESTP에게 조용하고 내성적인 면을 보여줄 수 있고, ESTP는 ISTP에게 사회적인 상황에서 더욱 적극적으로 참여하도록 도울 수 있습니다. ISTP는 때로 ESTP의 계획과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISFP", mbti: "예술가", strengths: "ISTP와 ISFP는 비슷한 센스와 민감한 감수성을 가진 유형으로, 서로를 잘 이해하고 공감할 수 있습니다. ISFP는 ISTP에게 감정적인 지원과 깊은 이해를 제공할 수 있고, ISTP는 ISFP에게 문제 해결과 실용적인 조언을 제공할 수 있습니다. 둘은 창의적인 프로젝트나 공동 작업을 통해 서로를 영감주며, 서로를 보완하여 균형 잡힌 관계를 형성할 수 있습니다. 그러나 ISTP는 때로 ISFP의 관계 관리와 조율에 대한 노력이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ESTJ", mbti: "사업가", strengths: "ISTP와 ESTJ는 서로를 보완하며 효과적으로 협력할 수 있는 유형입니다. ESTJ는 조직적이고 체계적인 성향을 가지고 있으며, ISTP의 아이디어를 구체화하고 실행에 옮길 수 있습니다. ISTP는 ESTJ에게 융통성과 적응력을 가르칠 수 있으며, 두 유형은 목표 달성을 위해 효과적으로 협력할 수 있습니다. 그러나 ISTP는 때로 ESTJ의 계획에 따라 일하는 것에 대한 융통성과 적응력을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INTP", mbti: "사색가", strengths: "ISTP와 INTP는 비슷한 인지 스타일을 가지고 있어 서로를 이해하고 공감할 수 있는 유형입니다. 둘 모두 분석적이고 논리적인 사고를 가지고 있으며, 문제 해결에 대한 열정을 공유합니다. ISTP는 INTP에게 실용적인 조언과 실행력을 제공할 수 있고, INTP는 ISTP에게 깊은 통찰력과 창의적인 아이디어를 제공할 수 있습니다. 둘은 함께 협력하여 문제를 해결하고 새로운 방향성을 모색할 수 있습니다. 그러나 ISTP는 때로 INTP의 사고의 유연성과 다양성에 대한 열린 마음을 가질 필요가 있습니다.", weaknesses: ""),
                ]
            case .istj:
                pacMembers = [
                    PacMemberDTO(name: "ESTJ", mbti: "활동적인 관리자", strengths: "ESTJ 유형은 실용적이고 활동적인 성향을 가지고 있습니다. ISTJ와 ESTJ는 모두 현실적이며 조직적인 특성을 가지고 있어 효율적인 업무 수행에 도움이 될 수 있습니다. ISTJ는 세부 사항에 깊이 관여하고 체계적으로 일하는 경향이 있는 반면, ESTJ는 빠른 의사결정과 실행력을 가지고 있어 조화롭게 협력할 수 있습니다. ISTJ는 ESTJ의 활동성과 적극성을 배울 수 있고, ESTJ는 ISTJ의 조직력과 철저한 계획 수립 능력을 배울 수 있습니다", weaknesses: ""),
                    PacMemberDTO(name: "ISFJ", mbti: "충실한 도우미", strengths: "ISFJ 유형은 따뜻하고 동정심이 많은 성향을 가지고 있습니다. ISTJ와 ISFJ는 둘 다 신뢰성이 높고 책임감이 강하며 협력적인 성향을 가지고 있어 팀 내에서 원활한 협업을 할 수 있습니다. ISTJ는 ISFJ의 사람들과의 관계 구축 능력과 다른 의견에 대한 이해를 배울 수 있고, ISFJ는 ISTJ의 분석력과 결정력을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INTJ", mbti: "전략적인 사고자", strengths: "INTJ 유형은 전략적이고 분석적인 성향을 가지고 있습니다. ISTJ와 INTJ는 모두 논리적인 사고를 잘하며 조직의 목표 달성을 위해 계획을 세우는 능력이 뛰어납니다. ISTJ는 INTJ의 전략적 사고와 미래 지향적인 성향을 배울 수 있고, INTJ는 ISTJ의 체계적인 업무 추진 능력을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTP", mbti: "논리적인 탐구자", strengths: "ISTP 유형은 논리적이고 탐구적인 성향을 가지고 있습니다. ISTJ와 ISTP는 모두 현실적이고 객관적인 성향을 가지고 있어 문제 해결과 실제적인 업무 처리에 능숙합니다. ISTJ는 ISTP의 융통성과 문제 해결 능력을 배울 수 있고, ISTP는 ISTJ의 집중력과 철저한 계획 수립 능력을 배울 수 있습니다.", weaknesses: "")
                ]
            case .isfp:
                pacMembers = [
                    PacMemberDTO(name: "ESFJ", mbti: "사교적인 외교관", strengths: "ISFP와 ESFJ는 서로를 보완하며 효과적으로 협력할 수 있는 유형입니다. ESFJ는 사교적이고 타인과의 관계 형성에 능숙한 경향이 있으며, ISFP는 예술적인 감각과 표현력을 가지고 있어 ESFJ에게 영감을 줄 수 있습니다. 둘은 서로의 창의적인 아이디어와 감성을 공유하며, 문제 해결과 의사 결정에 대해 협력적으로 접근할 수 있습니다. 그러나 ISFP는 때로 ESFJ의 계획과 조직적인 면을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INFP", mbti: "열정적인 중재자", strengths: "ISFP와 INFP는 감성적이고 이상적인 성향을 가진 유형으로, 서로를 이해하고 공감할 수 있습니다. INFP는 ISFP에게 깊은 감정적인 지원과 영감을 제공할 수 있고, ISFP는 INFP에게 현실적인 조언과 실행력을 제공할 수 있습니다. 둘은 창의적인 프로젝트나 예술 작품을 통해 서로를 영감주며, 서로를 보완하여 균형 잡힌 관계를 형성할 수 있습니다. 그러나 ISFP는 때로 INFP의 의사 결정과 구체화에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ESTP", mbti: "활동가", strengths: "ISFP와 ESTP는 서로 유사한 성향을 가지고 있어 잘 맞는 유형입니다. 둘 모두 현실적인 문제 해결에 능숙하며, 창의적인 아이디어와 실행력을 가지고 있습니다. ISFP는 ESTP에게 감성적인 표현과 예술적인 감각을 제공할 수 있고, ESTP는 ISFP를 현실적인 측면에서 지원할 수 있습니다. 둘은 서로를 영감주며, 공동 작업을 통해 창의적인 프로젝트를 수행할 수 있습니다. 그러나 ISFP는 때로 ESTP의 계획과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENFJ", mbti: "정의로운 사회자", strengths: "ISFP와 ENFJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ENFJ는 사회적인 상호작용에 능숙하고 타인의 감정을 이해하는 경향이 있으며, ISFP는 미적 감각과 예술적인 표현을 통해 ENFJ에게 영감을 줄 수 있습니다. 둘은 협력하여 사회적인 변화를 이루거나 공동의 이상을 실현할 수 있으며, 서로를 도와가며 성장할 수 있습니다. 그러나 ISFP는 때로 ENFJ의 계획과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]
            case .isfj:
                pacMembers = [
                    PacMemberDTO(name: "ESFJ", mbti: "사교적인 외교관", strengths: "ESFJ 유형은 사교적이고 동정심이 많은 성향을 가지고 있습니다. ISFJ와 ESFJ는 둘 다 협력적이고 사람들과의 관계 구축에 능숙하여 팀 내에서 원활한 협업을 할 수 있습니다. ISFJ는 ESFJ의 사회적 능력과 대인 관계 관리 능력을 배울 수 있고, ESFJ는 ISFJ의 신뢰성과 책임감을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTJ", mbti: "청렴결백한 관리자", strengths: "ISTJ 유형은 청렴결백한 관리자로 알려져 있습니다. ISFJ와 ISTJ는 모두 현실적이고 조직적인 특성을 가지고 있어 효율적인 업무 수행에 도움이 될 수 있습니다. ISFJ는 ISTJ의 분석력과 결정력을 배울 수 있고, ISTJ는 ISFJ의 사람들과의 관계 구축 능력과 다른 의견에 대한 이해를 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INFJ", mbti: "선의의 옹호자", strengths: "INFJ 유형은 선의의 옹호자로 알려져 있습니다. ISFJ와 INFJ는 둘 다 동정심이 많고 사람들의 감정에 민감하며 상대방의 필요를 이해하려는 성향을 가지고 있습니다. ISFJ는 INFJ의 창의성과 비전을 배울 수 있고, INFJ는 ISFJ의 현실적인 사고력과 실용성을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ESTJ", mbti: "활동적인 관리자", strengths: "ESTJ 유형은 실용적이고 활동적인 성향을 가지고 있습니다. ISFJ와 ESTJ는 둘 다 현실적이며 조직적인 특성을 가지고 있어 효율적인 업무 수행에 도움이 될 수 있습니다. ISFJ는 ESTJ의 활동성과 적극성을 배울 수 있고, ESTJ는 ISFJ의 조직력과 철저한 계획 수립 능력을 배울 수 있습니다.", weaknesses: "")
                ]
            case .intp:
                pacMembers = [
                    PacMemberDTO(name: "ENTJ", mbti: "대담한 통솔자", strengths: "INTP와 ENTJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ENTJ는 전략적인 사고와 조직적인 능력을 가지고 있으며, INTP는 분석적인 사고와 창의성을 가지고 있어 ENTJ에게 새로운 관점과 아이디어를 제공할 수 있습니다. 둘은 서로를 도와 전략적인 목표를 이루거나 복잡한 문제를 해결할 수 있으며, 서로의 능력을 존중하고 발전시킬 수 있습니다. 그러나 INTP는 때로 ENTJ의 감정적인 지원과 사회적인 상호작용에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INTJ", mbti: "용의주도한 전략가", strengths: "INTP와 INTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 공감할 수 있습니다. INTJ는 비전과 계획을 세우는 능력을 가지고 있으며, INTP는 분석적인 사고와 창의성을 가지고 있어 INTJ에게 새로운 관점과 아이디어를 제공할 수 있습니다. 둘은 깊은 대화와 함께 복잡한 문제를 해결하고, 서로를 지지하며 성장할 수 있습니다. 그러나 INTP는 때로 INTJ의 실행력과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENTP", mbti: "기민한 변론가", strengths: "INTP와 ENTP는 유사한 성향을 가지고 있어 잘 맞는 유형입니다. 둘 모두 분석적인 사고와 창의성을 가지고 있으며, 서로에게 새로운 아이디어와 도전을 줄 수 있습니다. INTP는 ENTP에게 논리적인 지원과 깊은 토론을 제공하고, ENTP는 INTP를 활발하게 할 수 있습니다. 둘은 서로를 이해하고 공감하며, 함께 새로운 아이디어를 탐구하고 실현할 수 있습니다. 그러나 INTP는 때로 ENTP의 계획과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTJ", mbti: "청렴결백한 논리주의자", strengths: "INTP와 ISTJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISTJ는 신뢰성과 체계적인 접근을 가지고 있으며, INTP는 분석적인 사고와 창의성을 가지고 있어 ISTJ에게 새로운 관점과 아이디어를 제공할 수 있습니다. 둘은 실질적인 문제 해결과 체계적인 계획을 함께 수행하며, 서로를 지지하고 공감할 수 있습니다. 그러나 INTP는 때로 ISTJ의 실행력과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]
            case .intj:
                pacMembers = [
                    PacMemberDTO(name: "INFJ", mbti: "선의의 옹호자", strengths: "INTJ와 INFJ는 비슷한 가치관과 목표를 공유하며, 서로를 잘 이해하고 조화롭게 지낼 수 있는 유형입니다. INFJ는 INTJ의 감성과 직관을 보완할 수 있고, INTJ는 INFJ에게 논리적인 사고와 분석력을 제공할 수 있습니다. 둘은 목표 지향적이고 조직적인 방식으로 일할 수 있으며, 서로를 도와가며 성장할 수 있습니다. 그러나 INTJ는 때로 감정 표현과 관계 관리 측면에서 INFJ의 도움이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENTP", mbti: "논쟁을 즐기는 변론가", strengths: "INTJ와 ENTP는 서로를 도전시키고 활발한 토론과 아이디어 교환을 즐기는 유형입니다. ENTP는 창의적인 아이디어를 제공하고, INTJ는 이를 실현시키는 계획과 전략을 제공할 수 있습니다. 둘은 서로에게 새로운 관점과 동기를 부여하며, 문제 해결과 혁신을 위해 함께 협력할 수 있습니다. 그러나 INTJ는 때로 ENTP의 계획의 실행과 구체화에 도움을 줄 필요가 있을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTJ", mbti: "청렴결백한 논리주의자", strengths: "INTJ와 ISTJ는 서로 비슷한 사고 방식과 가치관을 가지고 있어 매우 잘 맞는 유형입니다. ISTJ는 신중하고 체계적인 성향을 가지고 있으며, INTJ의 비전을 현실적인 방식으로 구체화할 수 있습니다. 둘은 목표 달성을 위해 협력하며, 신뢰와 안정감 있는 관계를 형성할 수 있습니다. 그러나 INTJ는 때로 ISTJ의 융통성과 새로운 아이디어에 대한 열린 마음을 배울 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENTJ", mbti: "대담한 통솔자", strengths: "INTJ와 ENTJ는 비슷한 지도자적인 성향을 가지고 있어 매우 잘 맞는 유형입니다. ENTJ는 결단력과 리더십 능력을 가지고 있으며, INTJ의 비전을 실현시키는데 도움을 줄 수 있습니다. 둘은 목표 지향적인 방식으로 일하며, 협력하여 조직적인 성과를 이룰 수 있습니다. 그러나 INTJ는 때로 ENTJ의 감정적인 지원과 조화를 이루는 방법을 배울 수 있습니다.", weaknesses: "")
                ]
            case .infp:
                pacMembers = [
                    PacMemberDTO(name: "ENFJ", mbti: "정의로운 사회자", strengths: "INFP와 ENFJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ENFJ는 사회적인 상호작용에 능숙하고 타인의 감정을 이해하는 경향이 있으며, INFP는 깊은 감정과 이상적인 가치를 가지고 있어 ENFJ에게 영감을 줄 수 있습니다. 둘은 협력하여 사회적인 변화를 이루거나 공동의 이상을 실현할 수 있으며, 서로를 도와가며 성장할 수 있습니다. 그러나 INFP는 때로 ENFJ의 계획과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INFJ", mbti: "선의의 수호자", strengths: "INFP와 INFJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 공감할 수 있습니다. INFJ는 깊은 이해와 직관력을 가지고 있으며, INFP는 자유로운 사고와 창의력을 가지고 있어 INFJ에게 영감을 줄 수 있습니다. 둘은 깊은 대화와 이상적인 가치를 공유하며, 서로를 지지하고 함께 성장할 수 있습니다. 그러나 INFP는 때로 INFJ의 현실적인 조언과 실행력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENFP", mbti: "재기발랄한 활동가", strengths: "INFP와 ENFP는 유사한 성향을 가지고 있어 잘 맞는 유형입니다. 둘 모두 열정적이고 창의적인 성향을 가지고 있으며, 서로에게 영감을 줄 수 있습니다. INFP는 ENFP에게 깊은 감정적인 지원과 현실적인 조언을 제공할 수 있고, ENFP는 INFP를 활발하게 할 수 있습니다. 둘은 서로를 이해하고 공감하며, 함께 새로운 아이디어를 탐구하고 실현할 수 있습니다. 그러나 INFP는 때로 ENFP의 계획과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISFJ", mbti: "용감한 수호자", strengths: "INFP와 ISFJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISFJ는 신뢰성과 책임감을 가지고 있으며, INFP는 창의성과 감수성을 가지고 있어 ISFJ에게 새로운 관점과 영감을 줄 수 있습니다. 둘은 서로를 지지하고 공감하며, 실질적인 문제 해결과 감정적인 지원을 함께 제공할 수 있습니다. 그러나 INFP는 때로 ISFJ의 계획과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]
            case .infj:
                pacMembers = [
                    PacMemberDTO(name: "ENFP", mbti: "열린 옹호자", strengths: "ENFP 유형은 INFJ와 매우 잘 맞는 유형 중 하나입니다. ENFP는 사람을 좋아하고 사회적인 연결을 중요시하는 경향이 있으며, 이는 INFJ의 따뜻하고 동정적인 성향과 잘 어울립니다. ENFP는 INFJ에게 새로운 아이디어와 자극을 제공하고, INFJ는 ENFP에게 감정적인 지지와 조언을 제공할 수 있습니다. 하지만 INFJ는 때로 ENFP의 스케줄 관리와 현실적인 측면을 도와줄 필요가 있을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INTJ", mbti: "용의주도한 전략가", strengths: "INFJ와 INTJ는 서로를 잘 이해하고 조화롭게 지낼 수 있는 유형입니다. INTJ는 논리적이고 분석적인 사고를 가지고 있으며, INFJ의 감성과 직관을 보완할 수 있습니다. 둘은 비슷한 가치관을 공유하며, 목표 지향적이고 조직적인 방식으로 일할 수 있습니다. 하지만 INFJ는 때로 INTJ의 감정 표현과 관계 관리에 도움을 줄 필요가 있을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENFJ", mbti: "정의로운 사회운동가", strengths: "INFJ와 ENFJ는 둘 다 사회적 변화를 이루고자 하는 성향을 가지고 있어 매우 잘 맞는 유형입니다. ENFJ는 사회적 영향력을 통해 다른 사람들을 도울 수 있는 능력을 가지고 있으며, INFJ의 집중력과 통찰력을 보완할 수 있습니다. 그러나 INFJ는 때로 ENFJ의 개인적인 시간과 휴식의 필요성을 이해하고 지원해줄 필요가 있을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTP", mbti: "만능 재주꾼", strengths: "INFJ와 ISTP는 서로 다른 특성을 가지고 있지만, 상호 보완적인 유형입니다. ISTP는 논리적이고 분석적인 사고를 가지고 있으며, 문제 해결 능력이 뛰어나기 때문에 INFJ의 결정에 도움을 줄 수 있습니다. 또한 INFJ는 ISTP의 실용성과 현실 감각을 배울 수 있습니다. 그러나 INFJ와 ISTP는 의사 소통과 감정 표현에 있어서 서로의 차이점을 이해하고 존중해야 합니다.", weaknesses: "")
                ]
            case .estp:
                pacMembers = [
                    PacMemberDTO(name: "ISTJ", mbti: "청렴결백한 논리주의자", strengths: "ESTP와 ISTJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISTJ는 신뢰성과 체계적인 접근을 가지고 있으며, ESTP는 적응력과 실행력을 가지고 있어 ISTJ에게 신선한 아이디어와 도전을 제공할 수 있습니다. 둘은 실질적인 문제 해결과 체계적인 계획을 함께 수행하며, 서로를 지지하고 공감할 수 있습니다. ESTP는 때로 ISTJ의 조직적인 면과 계획력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENFJ", mbti: "정의로운 사회운동가", strengths: "ESTP와 ENFJ는 긍정적인 관계를 형성할 수 있는 유형입니다. ENFJ는 사회적인 영향력과 조화로운 관계 형성을 잘하며, ESTP는 적응력과 활동적인 성향을 가지고 있어 ENFJ에게 활력과 열정을 제공할 수 있습니다. 둘은 서로를 도와 사회적인 목표를 이루거나 복잡한 문제를 해결할 수 있으며, 서로의 능력을 존중하고 발전시킬 수 있습니다. ESTP는 때로 ENFJ의 감정적인 지원과 조화로운 관계 형성에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INFP", mbti: "열정적인 중재자", strengths: "ESTP와 INFP는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. INFP는 감수성이 풍부하고 이상적인 가치를 추구하는 경향이 있으며, ESTP는 현실감각과 실용성을 가지고 있어 INFP에게 현실적인 조언과 지원을 제공할 수 있습니다. 둘은 서로를 이해하고 공감하며, 감정적인 지원과 창의적인 아이디어를 공유할 수 있습니다. ESTP는 때로 INFP의 감성적인 면과 내적인 성장에 대한 도움을 받을 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENTJ", mbti: "대담한 통솔자", strengths: "ESTP와 ENTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 공감할 수 있습니다. ENTJ는 전략적인 사고와 조직적인 능력을 가지고 있으며, ESTP는 적응력과 실행력을 가지고 있어 ENTJ에게 신선한 아이디어와 도전을 제공할 수 있습니다. 둘은 깊은 대화와 함께 복잡한 문제를 해결하고, 서로를 지지하며 성장할 수 있습니다. ESTP는 때로 ENTJ의 계획과 조직력에 대한 도움을 받을 수 있습니다.", weaknesses: "")
                ]
            case .estj:
                pacMembers = [
                    PacMemberDTO(
                        name: "ISTJ",
                        mbti: "청렴결백한 검사관",
                        strengths: "ESTJ와 ISTJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ISTJ는 체계적이고 세부적인 사항에 주의를 기울이는 경향이 있으며, ESTJ는 조직력과 리더십을 가지고 있어 ISTJ에게 명확한 방향과 구체적인 지침을 제공할 수 있습니다. 둘은 협력적으로 업무를 분담하고 효율적으로 일할 수 있으며, 서로의 강점을 살려 조화롭게 협력할 수 있습니다. ESTJ는 때로 ISTJ에게 유연성과 창의성을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ESFJ",
                        mbti: "사교적인 외교관",
                        strengths: "ESTJ와 ESFJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ESFJ는 사회적인 관계를 중시하고 다른 사람의 감정에 민감한 편이며, ESTJ는 조직력과 실행력을 가지고 있어 ESFJ에게 구체적인 계획과 조직적인 지원을 제공할 수 있습니다. 둘은 효과적인 의사소통과 협력을 통해 목표를 달성할 수 있으며, 서로의 감성과 사회적인 요소를 고려하면서 일할 수 있습니다. ESTJ는 때로 ESFJ에게 유연성과 참여를 촉진하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ESTP",
                        mbti: "모험을 즐기는 사업가",
                        strengths: "ESTJ와 ESTP는 서로를 보완하며 협력할 수 있는 유형입니다. ESTP는 적응력과 행동력을 가지고 있으며, ESTJ는 조직력과 계획력을 가지고 있어 ESTP에게 구체적인 지침과 효율적인 실행을 제공할 수 있습니다. 둘은 현실적인 문제 해결과 결과를 중시하며, 협력하여 프로젝트를 완수할 수 있습니다. ESTJ는 때로 ESTP에게 장기적인 계획과 조직적인 면에 대한 지원이 필요할 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ENFJ",
                        mbti: "정의로운 사회운동가",
                        strengths: "ESTJ와 ENFJ는 서로를 보완하며 깊은 관계를 형성할 수 있는 유형입니다. ENFJ는 사회적인 변화를 추구하고 다른 사람들을 도울 의지가 있으며, ESTJ는 조직력과 실행력을 가지고 있어 ENFJ에게 구체적인 계획과 조직적인 지원을 제공할 수 있습니다. 둘은 사회적인 목표를 공유하며 협력하여 사회적인 영향력을 행사할 수 있습니다. ESTJ는 때로 ENFJ에게 유연성과 적응력을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    )
                ]

            case .esfp:
                pacMembers = [
                    PacMemberDTO(name: "ISFJ", mbti: "용감한 수호자", strengths: "ESFP와 ISFJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISFJ는 섬세하고 신뢰할 수 있는 성향을 가지고 있으며, ESFP는 즐거움과 자유로움을 추구하는 경향이 있어 ISFJ에게 새로운 경험과 활기를 제공할 수 있습니다. 둘은 서로를 지지하고 돌봐주며, 감정적인 지원과 실용적인 조언을 공유할 수 있습니다. ESFP는 때로 ISFJ의 조직적인 면과 신뢰성에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENFP", mbti: "재기발랄한 활동가", strengths: "ESFP와 ENFP는 긍정적인 관계를 형성할 수 있는 유형입니다. ENFP는 창의력과 열정을 가지고 있으며, ESFP는 자유로움과 적응력을 가지고 있어 ENFP에게 자극과 자유로운 분위기를 제공할 수 있습니다. 둘은 서로의 아이디어와 열정을 공유하며, 상호 작용을 통해 창의적인 문제 해결과 새로운 가능성을 모색할 수 있습니다. ESFP는 때로 ENFP의 감성적인 면과 내적인 성장을 도와줄 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISTP", mbti: "만능 재주꾼", strengths: "ESFP와 ISTP는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ISTP는 논리적인 사고와 문제 해결 능력을 가지고 있으며, ESFP는 적응력과 에너지를 가지고 있어 ISTP에게 즉흥적인 아이디어와 활동을 제공할 수 있습니다. 둘은 함께 논리적인 문제 해결과 실용적인 실행을 할 수 있으며, 서로를 지지하고 배울 수 있습니다. ESFP는 때로 ISTP의 조용하고 내성적인 면을 이해하고 존중하는 것이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ESTJ", mbti: "근면한 사업가", strengths: "ESFP와 ESTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ESTJ는 조직적인 능력과 책임감을 가지고 있으며, ESFP는 즐거움과 융통성을 가지고 있어 ESTJ에게 활력과 유연성을 제공할 수 있습니다. 둘은 계획적인 일상 운영과 즐거움을 조화롭게 이룰 수 있으며, 서로의 강점을 살려 협력해 나갈 수 있습니다. ESFP는 때로 ESTJ의 조직적인 면과 계획력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]
            case .esfj:
                
                pacMembers = [
                    PacMemberDTO(
                        name: "ISFP",
                        mbti: "예술가",
                        strengths: "ESFJ와 ISFP는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ISFP는 예술적인 감각과 깊은 감수성을 가지고 있으며, ESFJ는 다른 사람과의 연결과 조화로운 관계를 형성하는 데 능숙합니다. 둘은 서로의 창의성과 감성을 공유하며, 예술적인 프로젝트나 사회적인 이벤트를 함께 기획하고 추진할 수 있습니다. ESFJ는 때로 ISFP에게 조직력과 실행력을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ESTJ",
                        mbti: "실제적인 관리자",
                        strengths: "ESFJ와 ESTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ESTJ는 조직력과 실행력을 가지고 있으며, ESFJ는 다른 사람들과의 관계를 중시하고 다른 사람의 감정에 민감한 편입니다. 둘은 목표 달성을 위해 효과적으로 협력하고, 조직적인 계획과 감성적인 요소를 조화롭게 결합시킬 수 있습니다. ESFJ는 때로 ESTJ에게 유연성과 창의성을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ENFP",
                        mbti: "재기발랄한 이상주의자",
                        strengths: "ESFJ와 ENFP는 서로를 보완하며 깊은 관계를 형성할 수 있는 유형입니다. ENFP는 창의적이고 활기찬 성향을 가지고 있으며, ESFJ는 다른 사람들과의 관계를 중요시하는 경향이 있습니다. 둘은 열정적으로 협력하여 사회적인 이벤트나 프로젝트를 기획하고 추진할 수 있으며, 서로의 아이디어와 가치를 공유하며 성장할 수 있습니다. ESFJ는 때로 ENFP에게 구체적인 계획과 조직적인 지원을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ISTJ",
                        mbti: "청렴결백한 검사관",
                        strengths: "ESFJ와 ISTJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISTJ는 체계적이고 세부적인 사항에 주의를 기울이는 경향이 있으며, ESFJ는 사회적인 관계를 중시하고 다른 사람의 감정에 민감한 편입니다. 둘은 협력적으로 업무를 분담하고 효율적으로 일할 수 있으며, 서로의 강점을 살려 조화롭게 협력할 수 있습니다. ESFJ는 때로 ISTJ에게 유연성과 창의성을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    )
                ]


            case .entp:
                pacMembers = [
                    PacMemberDTO(name: "INTJ", mbti: "용의주도한 전략가", strengths: "ENTP와 INTJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. INTJ는 분석적인 사고와 계획력을 가지고 있으며, ENTP는 새로운 아이디어와 창의력을 가지고 있어 INTJ에게 새로운 시각과 가능성을 제공할 수 있습니다. 둘은 서로의 강점을 살려 협력적인 문제 해결과 목표 달성을 할 수 있으며, 서로의 관점을 이해하고 존중하는 것이 중요합니다. ENTP는 때로 INTJ의 실제적인 면과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    
                    PacMemberDTO(name: "INFJ", mbti: "선의의 옹호자", strengths: "ENTP와 INFJ는 서로를 보완하며 깊은 관계를 형성할 수 있는 유형입니다. INFJ는 이해심과 공감 능력을 가지고 있으며, ENTP는 열정과 창의력을 가지고 있어 INFJ에게 영감과 자극을 제공할 수 있습니다. 둘은 서로의 감성과 아이디어를 공유하며, 깊은 대화와 상호 지지를 통해 서로의 성장을 도모할 수 있습니다. ENTP는 때로 INFJ의 실용적인 면과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    
                    PacMemberDTO(name: "ENFP", mbti: "재기발랄한 활동가", strengths: "ENTP와 ENFP는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ENFP는 열정과 자유로움을 추구하는 경향이 있으며, ENTP는 새로운 아이디어와 창의력을 가지고 있어 ENFP에게 즉각적인 피드백과 자극을 제공할 수 있습니다. 둘은 서로의 열정과 에너지를 공유하며, 즐거운 활동과 아이디어 실현을 함께 할 수 있습니다. ENTP는 때로 ENFP의 조직적인 면과 계획력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    
                    PacMemberDTO(name: "ISTP", mbti: "만능 재주꾼", strengths: "ENTP와 ISTP는 서로를 보완하며 협력할 수 있는 유형입니다. ISTP는 실제적인 문제 해결과 기술적인 능력을 가지고 있으며, ENTP는 새로운 아이디어와 창의력을 가지고 있어 ISTP에게 새로운 시각과 가능성을 제공할 수 있습니다. 둘은 실용적인 문제 해결과 현실적인 실행력을 발휘할 수 있으며, 상호간의 지원과 협력을 통해 목표를 달성할 수 있습니다. ENTP는 때로 ISTP의 조화롭고 실용적인 면과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]

            case .entj:
                pacMembers = [
                    PacMemberDTO(
                        name: "INTJ",
                        mbti: "용의주도한 전략가",
                        strengths: "ENTJ와 INTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. INTJ는 전략적이고 분석적인 성향을 가지고 있으며, ENTJ는 리더십과 실행력을 중요시하는 경향이 있습니다. 둘은 서로의 비전과 목표를 공유하며, 협력하여 복잡한 문제를 해결하고 목표를 달성할 수 있습니다. ENTJ는 때로 INTJ에게 조직력과 실행력을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ENFP",
                        mbti: "재기발랄한 활동가",
                        strengths: "ENTJ와 ENFP는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. ENFP는 창의적이고 사람을 이끌어가는 능력을 가지고 있으며, ENTJ는 목표 달성과 실행력을 중요시하는 경향이 있습니다. 둘은 서로의 아이디어와 열정을 공유하며, 협력하여 새로운 아이디어를 창출하고 새로운 도전에 도전할 수 있습니다. ENTJ는 때로 ENFP에게 구체적인 계획과 조직적인 지원을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ISTJ",
                        mbti: "청렴결백한 논리주의자",
                        strengths: "ENTJ와 ISTJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISTJ는 신뢰성과 철저함을 가진 성향을 가지고 있으며, ENTJ는 리더십과 실행력을 중요시하는 경향이 있습니다. 둘은 협력적으로 업무를 분담하고 조화롭게 일할 수 있으며, 서로의 강점을 살려 목표를 달성할 수 있습니다. ENTJ는 때로 ISTJ에게 유연성과 창의성을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ENTP",
                        mbti: "논쟁하는 변론가",
                        strengths: "ENTJ와 ENTP는 서로를 도전시키며 협력할 수 있는 유형입니다. ENTP는 창의적이고 논리적인 성향을 가지고 있으며, ENTJ는 리더십과 실행력을 중요시하는 경향이 있습니다. 둘은 서로의 아이디어와 비전을 공유하며, 협력하여 혁신적인 해결책을 모색하고 목표를 달성할 수 있습니다. ENTJ는 때로 ENTP에게 구체적인 계획과 조직적인 지원을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    )
                ]

            case .enfp:
                pacMembers = [
                    PacMemberDTO(name: "INFJ", mbti: "선의의 옹호자", strengths: "ENFP와 INFJ는 서로를 보완하며 깊은 관계를 형성할 수 있는 유형입니다. INFJ는 이해심과 공감 능력을 가지고 있으며, ENFP는 열정과 창의력을 가지고 있어 INFJ에게 영감과 자극을 제공할 수 있습니다. 둘은 서로의 감성과 아이디어를 공유하며, 깊은 대화와 상호 지지를 통해 서로의 성장을 도모할 수 있습니다. ENFP는 때로 INFJ의 실용적인 면과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "INTJ", mbti: "용의주도한 전략가", strengths: "ENFP와 INTJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. INTJ는 분석적인 사고와 계획력을 가지고 있으며, ENFP는 즉흥적인 아이디어와 창의력을 가지고 있어 INTJ에게 새로운 시각과 가능성을 제공할 수 있습니다. 둘은 서로의 강점을 살려 협력적인 문제 해결과 목표 달성을 할 수 있으며, 서로의 관점을 이해하고 존중하는 것이 중요합니다. ENFP는 때로 INTJ의 실제적인 면과 조직력에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ISFJ", mbti: "용감한 수호자", strengths: "ENFP와 ISFJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISFJ는 섬세하고 신뢰할 수 있는 성향을 가지고 있으며, ENFP는 열정과 자유로움을 추구하는 경향이 있어 ISFJ에게 새로운 경험과 활기를 제공할 수 있습니다. 둘은 서로를 지지하고 돌봐주며, 감정적인 지원과 실용적인 조언을 공유할 수 있습니다. ENFP는 때로 ISFJ의 조직적인 면과 신뢰성에 대한 지원이 필요할 수 있습니다.", weaknesses: ""),
                    PacMemberDTO(name: "ENTJ", mbti: "대담한 통솔자", strengths: "ENFP와 ENTJ는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ENTJ는 리더십과 조직력을 가지고 있으며, ENFP는 창의력과 융통성을 가지고 있어 ENTJ에게 새로운 아이디어와 열정을 제공할 수 있습니다. 둘은 목표 지향적인 협력과 실행력을 발휘할 수 있으며, 서로의 강점을 살려 성과를 이룰 수 있습니다. ENFP는 때로 ENTJ의 실제적인 면과 계획력에 대한 지원이 필요할 수 있습니다.", weaknesses: "")
                ]

            case .enfj:
                pacMembers = [
                    PacMemberDTO(
                        name: "INFP",
                        mbti: "열정적인 중재자",
                        strengths: "ENFJ와 INFP는 서로를 보완하며 깊은 관계를 형성할 수 있는 유형입니다. INFP는 감수성이 풍부하고 독립적인 성향을 가지고 있으며, ENFJ는 사회적인 변화를 추구하고 다른 사람들과의 관계를 중요시하는 경향이 있습니다. 둘은 서로의 가치와 이상을 공유하며, 사회적인 문제에 대한 열정과 창의적인 해결책을 함께 모색할 수 있습니다. ENFJ는 때로 INFP에게 조직력과 실행력을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ENTP",
                        mbti: "논쟁하는 변론가",
                        strengths: "ENFJ와 ENTP는 유사한 성향을 가진 유형으로, 서로를 이해하고 협력할 수 있습니다. ENTP는 창의적이고 논리적인 성향을 가지고 있으며, ENFJ는 사회적인 변화를 추구하고 다른 사람들과의 관계를 중요시하는 경향이 있습니다. 둘은 열정적으로 협력하여 사회적인 문제를 분석하고 해결책을 모색할 수 있으며, 서로의 아이디어와 지식을 공유하며 성장할 수 있습니다. ENFJ는 때로 ENTP에게 구체적인 계획과 조직적인 지원을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "INFJ",
                        mbti: "선의의 옹호자",
                        strengths: "ENFJ와 INFJ는 서로를 보완하며 긍정적인 관계를 형성할 수 있는 유형입니다. INFJ는 진솔하고 이해심 많은 성향을 가지고 있으며, ENFJ는 사회적인 변화를 추구하고 다른 사람들과의 관계를 중요시하는 경향이 있습니다. 둘은 서로의 가치와 이상을 공유하며, 사회적인 문제에 대한 공동의 목표를 달성하기 위해 협력할 수 있습니다. ENFJ는 때로 INFJ에게 구체적인 계획과 실행력을 제공하는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    ),
                    PacMemberDTO(
                        name: "ISFJ",
                        mbti: "용감한 수호자",
                        strengths: "ENFJ와 ISFJ는 서로를 보완하며 협력할 수 있는 유형입니다. ISFJ는 신뢰성과 책임감이 강한 성향을 가지고 있으며, ENFJ는 사회적인 변화를 추구하고 다른 사람들과의 관계를 중요시하는 경향이 있습니다. 둘은 협력적으로 업무를 분담하고 조화롭게 일할 수 있으며, 서로의 강점을 살려 사회적인 목표를 달성할 수 있습니다. ENFJ는 때로 ISFJ에게 유연성과 창의성을 더해주는 것이 도움이 될 수 있습니다.",
                        weaknesses: ""
                    )
                ]
            }
            return PacDTO(team: PacTeamDTO(members: pacMembers ?? []))
        }
    }
}
