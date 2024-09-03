import { ApiTags } from "@nestjs/swagger";
import { Body, Controller, Get, NotFoundException, Param, Post, Put } from "@nestjs/common";
import { EvaluationsService } from "../services/evaluations.service";
import { Evaluacion } from "../common/entities/evaluations.entity";
import { Curso } from "../../courses/common/entities/courses.entity";


@ApiTags('Evaluaciones y Planificaciones')
@Controller('evaluation')

export class EvaluationController {
    constructor(
        private evaluationService: EvaluationsService
    ) {
    }

    @Get('find-all')
    async findAll() {
        return this.evaluationService.findAll()
    }


    @Post('create-evaluation')
    async createEvaluation(@Body() value: any): Promise<Evaluacion[]> {
        return await this.evaluationService.create(value)
    }

    // @Put('update/:id')
    // async update(
    //     @Param('id') id: number,
    //     @Body() model: any,
    // ): Promise<Curso> {
    //     try {
    //         return await this.evaluationService.(id, updateAlumnoDto);
    //     } catch (error) {
    //         if (error.message === 'Student not found') {
    //             throw new NotFoundException('Student not found');
    //         }
    //         throw error;
    //     }
    // }


}
