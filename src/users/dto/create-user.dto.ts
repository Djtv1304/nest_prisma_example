import { IsString, IsNotEmpty, Length } from 'class-validator';
export class CreateUserDto {
    @IsString()
    @IsNotEmpty()
    @Length(1, 50)
    username: string;

    @IsString()
    @IsNotEmpty()
    @Length(1, 50)
    firstName: string;

    @IsString()
    @IsNotEmpty()
    @Length(1, 50)
    lastName: string;

    @IsString()
    @IsNotEmpty()
    @Length(1, 255)
    password: string;
}